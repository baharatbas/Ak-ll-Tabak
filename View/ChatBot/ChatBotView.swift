import SwiftUI

struct ChatBotView: View {
    @StateObject private var viewModel = ChatViewModel()
    @EnvironmentObject private var tabBarManager: TabBarVisibilityManager

    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.message) { message in
                    HStack {
                        if message.isUser {
                            Spacer()

                            Text(message.text)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        } else {
                            Text(message.text)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(12)

                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }

            HStack {
                TextField("Mesaj yaz...", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Gönder") {
                    viewModel.sendMesssage()
                }
            }
            .padding()
        }
        .navigationTitle("ChatBot AI")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            tabBarManager.hideCenterButton = true
        }
        .onDisappear {
            tabBarManager.hideCenterButton = false
        }
    }
}

#Preview {
    NavigationStack {
        ChatBotView()
            .environmentObject(TabBarVisibilityManager())
    }
}
