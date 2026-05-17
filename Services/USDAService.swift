import Foundation

final class USDAService {

    func fetchNutrition(for foodName: String) async throws -> MealAnalysisResult {
        if let localFood = TurkishFoodDatabase.find(for: foodName) {
            return MealAnalysisResult(
                foodName: localFood.displayName,
                calories: localFood.calories,
                protein: localFood.protein,
                carbs: localFood.carbs,
                fat: localFood.fat,
                comment: "\(localFood.displayName) için değerler Türk yemeklerine özel yerel tahmin veritabanından getirildi. Porsiyon, yağ miktarı ve ekmek/lavaş kullanımına göre değişebilir."
            )
        }
        let cleanQuery = cleanFoodName(foodName)
        let query = cleanQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? cleanQuery

        let urlString = "https://api.nal.usda.gov/fdc/v1/foods/search?query=\(query)&pageSize=10&api_key=\(APIKeys.usda)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        print("USDA SEARCH QUERY:", cleanQuery)
        print("USDA URL:", urlString)

        let (data, response) = try await URLSession.shared.data(from: url)

        if let httpResponse = response as? HTTPURLResponse {
            print("USDA STATUS CODE:", httpResponse.statusCode)
        }

        let raw = String(data: data, encoding: .utf8) ?? ""
        print("USDA RAW RESPONSE:", raw)

        let decoded = try JSONDecoder().decode(USDASearchResponse.self, from: data)

        guard let food = decoded.foods.first else {
            return MealAnalysisResult(
                foodName: cleanQuery,
                calories: 0,
                protein: 0,
                carbs: 0,
                fat: 0,
                comment: "Bu yemek USDA veritabanında bulunamadı."
            )
        }

        func nutrientContains(_ keyword: String) -> Double {
            food.foodNutrients.first {
                $0.nutrientName.lowercased().contains(keyword.lowercased())
            }?.value ?? 0
        }

        var calories = Int(nutrientContains("Energy").rounded())
        let protein = nutrientContains("Protein")
        let carbs = nutrientContains("Carbohydrate")
        let fat = nutrientContains("Total lipid")

        let lower = cleanQuery.lowercased()

        if lower.contains("burger") || lower.contains("hamburger") || lower.contains("cheeseburger") {
            if calories < 500 { calories = 650 }
        }

        if lower.contains("pizza") {
            if calories < 500 { calories = 850 }
        }

        if lower.contains("pasta") || lower.contains("makarna") {
            if calories < 400 { calories = 550 }
        }

        if lower.contains("rice") || lower.contains("pilav") {
            if calories < 250 { calories = 420 }
        }

        return MealAnalysisResult(
            foodName: food.description ?? cleanQuery,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            comment: "\(food.description ?? cleanQuery) için USDA veritabanından tahmini besin değerleri getirildi. Fotoğraftaki porsiyon ve içerik farkına göre değerler değişebilir."
        )
    }

    private func cleanFoodName(_ text: String) -> String {
        let lower = text.lowercased()

        if lower.contains("pizza") {
            return "pizza"
        }

        if lower.contains("burger") || lower.contains("hamburger") || lower.contains("cheeseburger") {
            return "cheeseburger"
        }

        if lower.contains("chicken") || lower.contains("tavuk") {
            return "chicken"
        }

        if lower.contains("pasta") || lower.contains("makarna") {
            return "pasta"
        }

        if lower.contains("rice") || lower.contains("pilav") {
            return "rice"
        }

        if lower.contains("salad") || lower.contains("salata") {
            return "salad"
        }

        return text
            .replacingOccurrences(of: "approx", with: "")
            .replacingOccurrences(of: "grams", with: "")
            .replacingOccurrences(of: "gram", with: "")
            .replacingOccurrences(of: "g", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

struct USDASearchResponse: Decodable {
    let foods: [USDAFood]
}

struct USDAFood: Decodable {
    let description: String?
    let foodNutrients: [USDANutrient]
}

struct USDANutrient: Decodable {
    let nutrientName: String
    let value: Double

    enum CodingKeys: String, CodingKey {
        case nutrientName
        case value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        nutrientName = (try? container.decode(String.self, forKey: .nutrientName)) ?? ""

        if let doubleValue = try? container.decode(Double.self, forKey: .value) {
            value = doubleValue
        } else if let intValue = try? container.decode(Int.self, forKey: .value) {
            value = Double(intValue)
        } else if let stringValue = try? container.decode(String.self, forKey: .value),
                  let doubleFromString = Double(stringValue) {
            value = doubleFromString
        } else {
            value = 0
        }
    }
}
