import Foundation

final class GeminiService {

    private let apiKey = ""

    func sendMessage(_ message: String) async throws -> String {

        let urlString =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent?key=\(apiKey)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let body: [String: Any] = [
            "contents": [
                [
                    "role": "user",
                    "parts": [
                        ["text": message]
                    ]
                ]
            ]
        ]

        let data = try JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let (responseData, _) = try await URLSession.shared.data(for: request)

        if let raw = String(data: responseData, encoding: .utf8) {
            print("GEMINI RAW RESPONSE:\n", raw)
        }

        let json = try JSONSerialization.jsonObject(with: responseData) as? [String: Any]

        if let error = json?["error"] as? [String: Any],
           let message = error["message"] as? String {
            throw NSError(domain: "GeminiError", code: 0, userInfo: [
                NSLocalizedDescriptionKey: message
            ])
        }

        guard
            let candidates = json?["candidates"] as? [[String: Any]],
            let content = candidates.first?["content"] as? [String: Any],
            let parts = content["parts"] as? [[String: Any]],
            let text = parts.first?["text"] as? String
        else {
            throw NSError(domain: "GeminiError", code: 0, userInfo: [
                NSLocalizedDescriptionKey: "Cevap çözümlenemedi"
            ])
        }

        return text
    }
}

