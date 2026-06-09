//
//  DrinkCategoryView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 9.06.2026.
//

import Foundation
import SwiftUI

struct DrinkCategoryView: View {
    var body: some View {
        CategoryProfessionalPage(
            title: "Drink",
            subtitle: "Günlük su tüketimini ve sağlıklı içecek seçimlerini destekle.",
            imageName: "drink1",
            color: .cyan,
            meals: [
                CategoryMeal(name: "Su", kcal: "0 kcal", icon: "drop.fill"),
                CategoryMeal(name: "Yeşil Smoothie", kcal: "160 kcal", icon: "leaf.circle.fill"),
                CategoryMeal(name: "Bitki Çayı", kcal: "5 kcal", icon: "mug.fill")
            ],
            tips: [
                "Gün içinde düzenli su içmeye çalış.",
                "Şekerli içecekleri mümkün olduğunca azalt.",
                "Smoothie hazırlarken ek şeker kullanmamaya dikkat et."
            ]
        )
    }
}
