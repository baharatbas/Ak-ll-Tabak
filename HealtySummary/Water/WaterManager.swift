import SwiftUI

final class AppDataManager: ObservableObject {

    // 💧 WATER
    @AppStorage("water_count") var waterCount: Int = 0
    @AppStorage("last_reset") var lastReset: Double = 0

    let waterGoal = 8

    // 🏃 ACTIVITY
    @AppStorage("step_count") var stepCount: Int = 0
    let stepGoal = 10000

    // 🥗 FOOD SCORE (0-100)
    @AppStorage("nutrition_score") var nutritionScore: Int = 70

    init() {
        dailyResetCheck()
    }

    func dailyResetCheck() {

        let today = Calendar.current.startOfDay(for: Date()).timeIntervalSince1970

        if lastReset == 0 {
            lastReset = today
            return
        }

        if today > lastReset {
            waterCount = 0
            stepCount = 0
            nutritionScore = Int.random(in: 60...85) // özgün günlük öneri
            lastReset = today
        }
    }

    // 💧 WATER
    func addWater() {
        dailyResetCheck()
        if waterCount < waterGoal {
            waterCount += 1
        }
    }

    // 🏃 ACTIVITY (fake ama working system)
    func addSteps(_ value: Int) {
        dailyResetCheck()
        stepCount += value
    }

    func resetAll() {
        waterCount = 0
        stepCount = 0
        nutritionScore = 70
    }
}
