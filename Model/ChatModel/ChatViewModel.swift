//
//  ChatViewModel.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 30.11.2025.
//

import SwiftUI
import Combine

class ChatViewModel:ObservableObject{
    @Published var message: [Message] = []
    @Published var currentInput: String = ""
    
    func sendMessage(){
        let userText = currentInput.trimmingCharacters(in: .whitespaces)
        guard !userText.isEmpty else {return}
        
        message.append(Message(text: userText, isUser: true))
        currentInput = ""
        
        respondToMessage(userText)
    }
    private func respondToMessage(_ text: String){
        var answer = ""
        if text.lowercased().contains("kalori"){
            answer = "Bir yiyeceğin kalorisini öğrenmek için fotoğraf çekebilirsin 🍽️"
        }else if text.lowercased().contains("detoks"){
            answer = "Sana özel detoks listeleri hazırlayabilirim 💧"

        }else if text.lowercased().contains("merhaba"){
            answer = "Merhaba! Sana nasıl yardımcı olabilirim? 😊"

        }else{
            answer = "Bu konuda tam anlamadım ama sana yardımcı olmaya hazırım! 🤖"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.message.append(Message(text: answer, isUser: false))
        }
    }
    
}
