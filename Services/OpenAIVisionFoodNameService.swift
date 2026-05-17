//
//  OpenAIVisionFoodNameService.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 17.05.2026.
//

import Foundation
import UIKit

final class OpenAIVisionFoodNameService {

    func detectFoodName(from image: UIImage) async throws -> String {
        guard let imageData = image.jpegData(compressionQuality: 0.6) else {
            throw URLError(.cannotDecodeContentData)
        }

        let base64 = imageData.base64EncodedString()

        let url = URL(string: "https://api.openai.com/v1/chat/completions")!

        let prompt = """
        Analyze the food image.

        Return only valid JSON. No markdown. No explanation.

        Format:
        {
          "searchTerm": "pizza",
          "estimatedGrams": 400
        }

        Rules:
        - searchTerm must be short and searchable in USDA FoodData Central.
        - Use English only.
        - estimatedGrams must be an approximate edible portion weight.
        - If unsure, estimate a realistic portion.
        """

        let body: [String: Any] = [
            "model": "gpt-4o-mini",
            "messages": [
                [
                    "role": "user",
                    "content": [
                        ["type": "text", "text": prompt],
                        [
                            "type": "image_url",
                            "image_url": [
                                "url": "data:image/jpeg;base64,\(base64)"
                            ]
                        ]
                    ]
                ]
            ],
            "max_tokens": 30
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(APIKeys.openAI)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("OPENAI STATUS CODE:", httpResponse.statusCode)
        }

        let rawResponse = String(data: data, encoding: .utf8) ?? "Cevap okunamadı"
        print("OPENAI RAW RESPONSE:", rawResponse)

        if let errorResponse = try? JSONDecoder().decode(OpenAIErrorResponse.self, from: data) {
            throw NSError(
                domain: "OpenAI",
                code: 429,
                userInfo: [NSLocalizedDescriptionKey: errorResponse.error.message]
            )
        }

        let decoded = try JSONDecoder().decode(OpenAIChatResponse.self, from: data)

        let content = decoded.choices.first?.message.content
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        print("OPENAI FOOD JSON:", content)

        let foodInfo = try JSONDecoder().decode(
            FoodVisionResult.self,
            from: Data(content.utf8)
        )

        return foodInfo.searchTerm
    }
}

struct OpenAIChatResponse: Decodable {
    let choices: [OpenAIChoice]
}

struct OpenAIChoice: Decodable {
    let message: OpenAIMessage
}

struct OpenAIMessage: Decodable {
    let content: String
}
struct OpenAIErrorResponse: Decodable {
    let error: OpenAIAPIError
}

struct OpenAIAPIError: Decodable {
    let message: String
    let type: String?
    let code: String?
}

struct FoodVisionResult: Decodable {
    let searchTerm: String
    let estimatedGrams: Double
}
