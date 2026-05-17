//
//  TurkishFoodDatabase.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 17.05.2026.
//

import Foundation
import Foundation

struct TurkishFoodNutrition {
    let displayName: String
    let usdaSearchTerm: String
    let calories: Int
    let protein: Double
    let carbs: Double
    let fat: Double
}

enum TurkishFoodDatabase {

    static func find(for text: String) -> TurkishFoodNutrition? {
        let lower = text.lowercased()

        let foods: [(keywords: [String], item: TurkishFoodNutrition)] = [
            (["cağ", "cag", "cağ kebap", "cag kebap"], .init(displayName: "Cağ Kebap", usdaSearchTerm: "lamb kebab", calories: 650, protein: 42, carbs: 35, fat: 36)),
            (["döner", "doner"], .init(displayName: "Döner", usdaSearchTerm: "doner kebab", calories: 700, protein: 38, carbs: 45, fat: 38)),
            (["iskender"], .init(displayName: "İskender Kebap", usdaSearchTerm: "lamb kebab with bread yogurt sauce", calories: 850, protein: 42, carbs: 65, fat: 48)),
            (["adana"], .init(displayName: "Adana Kebap", usdaSearchTerm: "ground lamb kebab", calories: 720, protein: 40, carbs: 38, fat: 46)),
            (["urfa"], .init(displayName: "Urfa Kebap", usdaSearchTerm: "ground lamb kebab", calories: 680, protein: 39, carbs: 36, fat: 42)),
            (["lahmacun"], .init(displayName: "Lahmacun", usdaSearchTerm: "flatbread with minced meat", calories: 330, protein: 14, carbs: 42, fat: 12)),
            (["pide", "kaşarlı pide", "kiymali pide", "kıymalı pide"], .init(displayName: "Pide", usdaSearchTerm: "turkish pide", calories: 620, protein: 24, carbs: 72, fat: 26)),
            (["mantı", "manti"], .init(displayName: "Mantı", usdaSearchTerm: "dumplings with yogurt", calories: 600, protein: 24, carbs: 70, fat: 24)),
            (["menemen"], .init(displayName: "Menemen", usdaSearchTerm: "scrambled eggs tomato pepper", calories: 350, protein: 18, carbs: 16, fat: 24)),
            (["simit"], .init(displayName: "Simit", usdaSearchTerm: "sesame bread", calories: 420, protein: 12, carbs: 72, fat: 10)),
            (["börek", "borek"], .init(displayName: "Börek", usdaSearchTerm: "cheese pastry", calories: 520, protein: 16, carbs: 52, fat: 28)),
            (["gözleme", "gozleme"], .init(displayName: "Gözleme", usdaSearchTerm: "stuffed flatbread", calories: 480, protein: 18, carbs: 58, fat: 20)),
            (["köfte", "kofte"], .init(displayName: "Köfte", usdaSearchTerm: "meatballs", calories: 560, protein: 36, carbs: 28, fat: 34)),
            (["pilav"], .init(displayName: "Pilav", usdaSearchTerm: "rice pilaf", calories: 380, protein: 7, carbs: 74, fat: 7)),
            (["kuru fasulye"], .init(displayName: "Kuru Fasulye", usdaSearchTerm: "white bean stew", calories: 420, protein: 22, carbs: 58, fat: 10)),
            (["mercimek çorbası", "mercimek corbasi", "lentil soup"], .init(displayName: "Mercimek Çorbası", usdaSearchTerm: "lentil soup", calories: 220, protein: 12, carbs: 32, fat: 6)),
            (["ezogelin"], .init(displayName: "Ezogelin Çorbası", usdaSearchTerm: "lentil bulgur soup", calories: 240, protein: 10, carbs: 36, fat: 7)),
            (["içli köfte", "icli kofte"], .init(displayName: "İçli Köfte", usdaSearchTerm: "stuffed meatball bulgur", calories: 360, protein: 16, carbs: 36, fat: 18)),
            (["dolma", "sarma"], .init(displayName: "Dolma/Sarma", usdaSearchTerm: "stuffed grape leaves rice", calories: 330, protein: 8, carbs: 46, fat: 14)),
            (["baklava"], .init(displayName: "Baklava", usdaSearchTerm: "baklava", calories: 450, protein: 7, carbs: 55, fat: 24))
        ]

        for food in foods {
            if food.keywords.contains(where: { lower.contains($0) }) {
                return food.item
            }
        }

        return nil
    }
}
