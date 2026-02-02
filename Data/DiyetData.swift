//
//  Diyet.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 27.11.2025.
//

import SwiftUI

struct Dıyet: Identifiable {
       let id = UUID()
       let name: String
       let describe: String
       let image: String
       let color: Color
       let type: DietType
}
