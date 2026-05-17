//
//  LocalNutritionDatabase.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 17.05.2026.
//

import Foundation

struct NutritionEstimate {
    let calories: Int
    let protein: Double
    let carbs: Double
    let fat: Double
    let healthScore: Int
}

enum LocalNutritionDatabase {

    static func estimate(for foodName: String) -> NutritionEstimate {
        let name = foodName.lowercased()

        if name.contains("pizza") {
            return NutritionEstimate(calories: 750, protein: 28, carbs: 85, fat: 32, healthScore: 48)
        }

        if name.contains("burger") || name.contains("hamburger") {
            return NutritionEstimate(calories: 650, protein: 30, carbs: 55, fat: 35, healthScore: 45)
        }

        if name.contains("salad") || name.contains("salata") {
            return NutritionEstimate(calories: 220, protein: 8, carbs: 18, fat: 12, healthScore: 86)
        }

        if name.contains("chicken") || name.contains("tavuk") {
            return NutritionEstimate(calories: 420, protein: 42, carbs: 20, fat: 16, healthScore: 78)
        }

        if name.contains("rice") || name.contains("pilav") {
            return NutritionEstimate(calories: 360, protein: 7, carbs: 72, fat: 5, healthScore: 58)
        }

        if name.contains("pasta") || name.contains("makarna") {
            return NutritionEstimate(calories: 520, protein: 16, carbs: 78, fat: 14, healthScore: 52)
        }

        if name.contains("soup") || name.contains("çorba") {
            return NutritionEstimate(calories: 180, protein: 7, carbs: 24, fat: 6, healthScore: 72)
        }

        if name.contains("steak") || name.contains("meat") || name.contains("et") {
            return NutritionEstimate(calories: 580, protein: 48, carbs: 12, fat: 35, healthScore: 65)
        }

        return NutritionEstimate(calories: 430, protein: 18, carbs: 45, fat: 18, healthScore: 60)
    }
}
