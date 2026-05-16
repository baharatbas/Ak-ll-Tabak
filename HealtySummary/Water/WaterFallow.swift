import SwiftUI
struct WaterSummary: View {

    @StateObject private var manager = AppDataManager()

    private var progress: CGFloat {
        CGFloat(manager.waterCount) / CGFloat(manager.waterGoal)
    }

    var body: some View {

        VStack(spacing: 20) {

            Text("Su Takibi")
                .font(.title.bold())

            ProgressView(value: Double(manager.waterCount),
                         total: Double(manager.waterGoal))
                .tint(.green)
                .scaleEffect(x: 1, y: 2)

            Text("\(manager.waterCount) / \(manager.waterGoal) bardak")

            Button("Bardak Ekle") {
                manager.addWater()
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
    }
}
