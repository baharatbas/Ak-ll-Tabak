//
//  DoctorData.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 23.02.2026.
//

import SwiftUI

struct Doctor: Identifiable{
    let id = UUID()
    let name: String
    let title: String
    let price: Double
    let description: String
    let image: String
}
