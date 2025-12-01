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
}
