//
//  SnacksCategoryView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 9.06.2026.
//

import Foundation
import SwiftUI

struct SnacksCategoryView: View {
    var body: some View {
        CategoryProfessionalPage(
            title: "Snacks",
            subtitle: "Hafif, pratik ve sağlıklı ara öğün seçenekleri.",
            imageName: "snak",
            color: .purple,
            meals: [
                CategoryMeal(name: "Meyve & Kuruyemiş", kcal: "220 kcal", icon: "apple.logo"),
                CategoryMeal(name: "Yoğurt Kasesi", kcal: "180 kcal", icon: "cup.and.saucer.fill"),
                CategoryMeal(name: "Protein Bar", kcal: "210 kcal", icon: "bolt.fill")
            ],
            tips: [
                "Ara öğünlerde porsiyon kontrolüne dikkat et.",
                "Şekerli paketli ürünler yerine doğal alternatifleri seç.",
                "Lifli atıştırmalıklar daha uzun süre tok tutar."
            ]
        )
    }
}
