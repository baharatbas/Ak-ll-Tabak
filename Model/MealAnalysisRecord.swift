//
//  MealAnalysisRecord.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 17.05.2026.
//

import Foundation
import SwiftData

@Model
final class MealAnalysisRecord {
    var foodName: String
    var calories: Int
    var protein: Double
    var carbs: Double
    var fat: Double
    var comment: String
    var createdAt: Date

    init(
        foodName: String,
        calories: Int,
        protein: Double,
        carbs: Double,
        fat: Double,
        comment: String,
        createdAt: Date = Date()
    ) {
        self.foodName = foodName
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
        self.fat = fat
        self.comment = comment
        self.createdAt = createdAt
    }
}
