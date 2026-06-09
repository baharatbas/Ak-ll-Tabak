//
//  VeganCategoryView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 9.06.2026.
//

import Foundation
import SwiftUI

struct VeganCategoryView: View {
    var body: some View {
        CategoryProfessionalPage(
            title: "Vegan",
            subtitle: "Bitkisel, dengeli ve sağlıklı vegan beslenme önerileri.",
            imageName: "vegan",
            color: .green,
            meals: [
                CategoryMeal(name: "Avokado Tost", kcal: "350 kcal", icon: "leaf.fill"),
                CategoryMeal(name: "Nohut Bowl", kcal: "420 kcal", icon: "takeoutbag.and.cup.and.straw.fill"),
                CategoryMeal(name: "Mercimek Çorbası", kcal: "280 kcal", icon: "fork.knife")
            ],
            tips: [
                "Protein için nohut, mercimek ve fasulye tercih edebilirsin.",
                "B12 takviyesi vegan beslenmede önemlidir.",
                "Kuruyemiş ve tohumlarla sağlıklı yağ alımını destekleyebilirsin."
            ]
        )
    }
}
