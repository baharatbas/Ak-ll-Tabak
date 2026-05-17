import UIKit
import Foundation

final class MealAnalysisService {

    private let visionService = OpenAIVisionFoodNameService()
    private let usdaService = USDAService()

    func analyze(image: UIImage) async throws -> MealAnalysisResult {
        let foodName = try await visionService.detectFoodName(from: image)
        return try await usdaService.fetchNutrition(for: foodName)
    }
}
