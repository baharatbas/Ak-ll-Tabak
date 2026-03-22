import Foundation

final class GeminiService {

    private let apiKey = ""

    func sendMessage(_ message: String) async throws -> String {

        let urlString =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent?key=\(apiKey)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let improvedPrompt = """
        Sen Akıllı Tabak uygulamasının yapay zeka beslenme asistanısın.

        Cevap stilin:
        - Açıklayıcı ve öğretici ol.
        - Kullanıcıya konuyu gerçekten anlamasını sağlayacak şekilde anlat.
        - Gereksiz uzunluk yapma ama yüzeysel de kalma.
        - Net, mantıklı ve akıcı yaz.
        - Cümleler sade ve güçlü olsun.

        Yazım formatı:
        - Cevabı paragraflara böl.
        - Gerekirse başlık kullan ama sade olsun.
        - Maddeleme kullanıyorsan temiz ve düzenli kullan.
        - Her bölüm arasında boşluk bırak (okunabilirlik için).

        Ton:
        - Samimi ama profesyonel
        - Öğreten ama sıkmayan
        - Direkt konuya giren

        Kurallar:
        - Türkçe yaz
        - Gereksiz markdown (###, ***, ---) kullanma
        - Emojiyi çok kullan 
        - Mobil ekranda rahat okunacak şekilde yaz

        Cevap yapısı:
        1. Kısa açıklama (konuyu özetle)
        3. Gerekirse öneriler / örnekler

        Amaç:
        Kullanıcı cevabı okuduğunda "tamam bunu anladım" demeli.

        Kullanıcı mesajı:
        \(message)
        """

        let body: [String: Any] = [
            "contents": [
                [
                    "role": "user",
                    "parts": [
                        ["text": improvedPrompt]
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

        return temizleCevap(text)
    }
    private func temizleCevap(_ text: String) -> String {
        var result = text
        result = result.replacingOccurrences(of: "###", with: "")
        result = result.replacingOccurrences(of: "##", with: "")
        result = result.replacingOccurrences(of: "#", with: "")
        result = result.replacingOccurrences(of: "**", with: "")
        result = result.replacingOccurrences(of: "---", with: "\n")
        return result
        
    }
}

