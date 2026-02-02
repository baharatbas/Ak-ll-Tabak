//
//  ChatBotView.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 30.11.2025.
//

import Foundation
import SwiftUI
import SwiftUI
struct ChatBotView: View {
   

        @StateObject private var viewModel = ChatViewModel()

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
        }
    }

#Preview {
    ChatBotView()
}
