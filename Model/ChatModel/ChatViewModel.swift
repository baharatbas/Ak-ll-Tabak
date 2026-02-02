import SwiftUI

class ChatViewModel: ObservableObject {

    @Published var message: [Message] = []
    @Published var inputText: String = ""

    private let service = GeminiService()

    func sendMesssage() {
        guard !inputText.isEmpty else { return }

        let userMessage = Message(text: inputText, isUser: true)
        message.append(userMessage)

        let prompt = inputText
        inputText = ""

        Task {
            do {
                let response = try await service.sendMessage(prompt)

                await MainActor.run {
                    self.message.append(
                        Message(text: response, isUser: false)
                    )
                }

            } catch {
                await MainActor.run {
                    self.message.append(
                        Message(
                            text: "Hata: \(error.localizedDescription)",
                            isUser: false
                        )
                    )
                }
            }
        }
    }
}

