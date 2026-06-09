//
//  ProteinCategoryView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 9.06.2026.
//

import Foundation
import SwiftUI

struct ProteinCategoryView: View {
    var body: some View {
        CategoryProfessionalPage(
            title: "Protein",
            subtitle: "Kas gelişimini ve günlük enerjiyi destekleyen protein seçenekleri.",
            imageName: "protein",
            color: .blue,
            meals: [
                CategoryMeal(name: "Izgara Tavuk", kcal: "480 kcal", icon: "figure.strengthtraining.traditional"),
                CategoryMeal(name: "Yumurta Tabağı", kcal: "300 kcal", icon: "circle.grid.cross.fill"),
                CategoryMeal(name: "Yoğurt Bowl", kcal: "250 kcal", icon: "cup.and.saucer.fill")
            ],
            tips: [
                "Her ana öğünde protein kaynağı bulundurmaya çalış.",
                "Tavuk, yumurta, yoğurt ve baklagiller iyi seçeneklerdir.",
                "Aşırı yağlı pişirme yöntemlerinden kaçın."
            ]
        )
    }
}
