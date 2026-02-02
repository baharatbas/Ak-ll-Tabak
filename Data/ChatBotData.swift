//
//  ChatBotData.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 30.11.2025.
//

import SwiftUI

struct Message: Identifiable{
    let id = UUID()
    let text: String
    let isUser: Bool
    //burada true olması kullanıcı cevabını olduğunu söyler false olması gemini cevabı olduğunu gösterir bize
}
