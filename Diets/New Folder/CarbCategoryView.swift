//
//  CarbCategoryView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 9.06.2026.
//

import Foundation
import SwiftUI

struct CarbCategoryView: View {
    var body: some View {
        CategoryProfessionalPage(
            title: "Carb",
            subtitle: "Enerji veren, dengeli karbonhidrat kaynakları.",
            imageName: "grad",
            color: .orange,
            meals: [
                CategoryMeal(name: "Yulaf Kasesi", kcal: "320 kcal", icon: "sunrise.fill"),
                CategoryMeal(name: "Esmer Pirinç Bowl", kcal: "450 kcal", icon: "bowl.fill"),
                CategoryMeal(name: "Tatlı Patates", kcal: "260 kcal", icon: "flame.fill")
            ],
            tips: [
                "Basit şeker yerine kompleks karbonhidratları seç.",
                "Karbonhidratı proteinle birlikte tüketmek daha dengeli olur.",
                "Tam tahıllı ürünler daha uzun süre tok tutar."
            ]
        )
    }
}
