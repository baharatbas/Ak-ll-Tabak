import Foundation

final class USDAService {

    func fetchNutrition(for foodName: String) async throws -> MealAnalysisResult {
        let cleanQuery = cleanFoodName(foodName)

        // 1) Önce Türk/local fallback kontrolü
        if let localFood = TurkishFoodDatabase.find(for: cleanQuery) ?? TurkishFoodDatabase.find(for: foodName) {
            return makeLocalResult(localFood)
        }

        // 2) USDA dene, hata olursa local tahmine düş
        do {
            return try await fetchFromUSDA(cleanQuery: cleanQuery)
        } catch {
            print("⚠️ USDA hata verdi, local fallback kullanılacak:", error.localizedDescription)
            return makeGenericFallback(for: cleanQuery)
        }
    }

    private func fetchFromUSDA(cleanQuery: String) async throws -> MealAnalysisResult {
        var components = URLComponents(string: "https://api.nal.usda.gov/fdc/v1/foods/search")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: APIKeys.usda),
            URLQueryItem(name: "query", value: cleanQuery),
            URLQueryItem(name: "pageSize", value: "10")
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        print("USDA FINAL URL:", url.absoluteString)

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        print("USDA STATUS CODE:", httpResponse.statusCode)

        guard httpResponse.statusCode == 200 else {
            throw NSError(
                domain: "USDA",
                code: httpResponse.statusCode,
                userInfo: [NSLocalizedDescriptionKey: "USDA status code: \(httpResponse.statusCode)"]
            )
        }

        let decoded = try JSONDecoder().decode(USDASearchResponse.self, from: data)

        guard let food = decoded.foods.first else {
            throw NSError(
                domain: "USDA",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: "USDA sonucu bulunamadı."]
            )
        }

        func nutrientContains(_ keyword: String) -> Double {
            food.foodNutrients.first {
                $0.nutrientName.lowercased().contains(keyword.lowercased())
            }?.value ?? 0
        }

        var calories = Int(nutrientContains("Energy").rounded())
        var protein = nutrientContains("Protein")
        var carbs = nutrientContains("Carbohydrate")
        var fat = nutrientContains("Total lipid")

        // USDA çok düşük dönerse gerçekçi minimum düzeltme
        applyMinimumFixes(
            query: cleanQuery,
            calories: &calories,
            protein: &protein,
            carbs: &carbs,
            fat: &fat
        )

        return MealAnalysisResult(
            foodName: food.description ?? cleanQuery,
            calories: calories,
            protein: protein,
            carbs: carbs,
            fat: fat,
            comment: "\(food.description ?? cleanQuery) için besin değerleri USDA veritabanından getirildi. Porsiyon ve içerik farkına göre değerler değişebilir."
        )
    }

    private func makeLocalResult(_ food: TurkishFoodNutrition) -> MealAnalysisResult {
        MealAnalysisResult(
            foodName: food.displayName,
            calories: food.calories,
            protein: food.protein,
            carbs: food.carbs,
            fat: food.fat,
            comment: "\(food.displayName) için değerler yerel tahmin veritabanından getirildi. Porsiyon, yağ miktarı ve ekmek/lavaş kullanımına göre değişebilir."
        )
    }

    private func makeGenericFallback(for foodName: String) -> MealAnalysisResult {
        let lower = foodName.lowercased()

        if lower.contains("pizza") {
            return MealAnalysisResult(
                foodName: "Pizza",
                calories: 850,
                protein: 35,
                carbs: 95,
                fat: 34,
                comment: "USDA sonucu alınamadığı için pizza için gerçekçi ortalama porsiyon tahmini kullanıldı."
            )
        }

        if lower.contains("burger") || lower.contains("hamburger") || lower.contains("cheeseburger") {
            return MealAnalysisResult(
                foodName: "Hamburger",
                calories: 650,
                protein: 32,
                carbs: 55,
                fat: 35,
                comment: "USDA sonucu alınamadığı için hamburger için gerçekçi ortalama porsiyon tahmini kullanıldı."
            )
        }

        if lower.contains("rice") || lower.contains("pilav") {
            return MealAnalysisResult(
                foodName: "Pilav",
                calories: 380,
                protein: 7,
                carbs: 74,
                fat: 7,
                comment: "USDA sonucu alınamadığı için pilav için ortalama porsiyon tahmini kullanıldı."
            )
        }

        if lower.contains("chicken") || lower.contains("tavuk") {
            return MealAnalysisResult(
                foodName: "Tavuk",
                calories: 430,
                protein: 42,
                carbs: 10,
                fat: 18,
                comment: "USDA sonucu alınamadığı için tavuk yemeği için ortalama porsiyon tahmini kullanıldı."
            )
        }

        if lower.contains("pasta") || lower.contains("makarna") {
            return MealAnalysisResult(
                foodName: "Makarna",
                calories: 550,
                protein: 18,
                carbs: 80,
                fat: 16,
                comment: "USDA sonucu alınamadığı için makarna için ortalama porsiyon tahmini kullanıldı."
            )
        }

        return MealAnalysisResult(
            foodName: foodName.capitalized,
            calories: 500,
            protein: 20,
            carbs: 50,
            fat: 20,
            comment: "USDA sonucu alınamadığı için genel ortalama yemek tahmini kullanıldı. Daha doğru sonuç için yemek adı veritabanına eklenebilir."
        )
    }

    private func applyMinimumFixes(
        query: String,
        calories: inout Int,
        protein: inout Double,
        carbs: inout Double,
        fat: inout Double
    ) {
        let lower = query.lowercased()

        if lower.contains("pizza"), calories < 500 {
            calories = 850
            protein = max(protein, 35)
            carbs = max(carbs, 95)
            fat = max(fat, 34)
        }

        if lower.contains("burger") || lower.contains("hamburger") || lower.contains("cheeseburger"), calories < 500 {
            calories = 650
            protein = max(protein, 32)
            carbs = max(carbs, 55)
            fat = max(fat, 35)
        }

        if lower.contains("rice") || lower.contains("pilav"), calories < 250 {
            calories = 380
            protein = max(protein, 7)
            carbs = max(carbs, 74)
            fat = max(fat, 7)
        }
    }

    private func cleanFoodName(_ text: String) -> String {
        let lower = text.lowercased()

        if lower.contains("pizza") { return "pizza" }
        if lower.contains("burger") || lower.contains("hamburger") || lower.contains("cheeseburger") { return "cheeseburger" }
        if lower.contains("rice") || lower.contains("pilav") { return "rice" }
        if lower.contains("chicken") || lower.contains("tavuk") { return "chicken" }
        if lower.contains("pasta") || lower.contains("makarna") { return "pasta" }
        if lower.contains("salad") || lower.contains("salata") { return "salad" }
        if lower.contains("kebab") || lower.contains("kebap") || lower.contains("cağ") || lower.contains("cag") { return "cağ kebap" }

        return lower
            .replacingOccurrences(of: "approx", with: "")
            .replacingOccurrences(of: "grams", with: "")
            .replacingOccurrences(of: "gram", with: "")
            .replacingOccurrences(of: " g", with: "")
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
