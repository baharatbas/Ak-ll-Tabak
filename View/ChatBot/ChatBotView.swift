//
//  ChatBotView.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 30.11.2025.
//

import Foundation
import SwiftUICore
import SwiftUI
struct ChatBotView: View {
    @StateObject var vm = ChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(vm.message) { msg in
                    HStack {
                        if msg.isUser {
                            Spacer()
                            Text(msg.text)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(12)
                                .padding(.horizontal)
                        } else {
                            Text(msg.text)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(12)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                    .padding(.vertical, 2)
                }
            }
            
            // INPUT
            HStack {
                TextField("Bir şey yaz...", text: $vm.currentInput)
                    .textFieldStyle(.roundedBorder)
                
                Button("Gönder") {
                    vm.sendMessage()
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatBotView()
}
