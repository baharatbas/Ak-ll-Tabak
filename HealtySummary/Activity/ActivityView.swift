//
//  ActivityView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 16.05.2026.
//

import SwiftUI
struct ActivityView: View {

    @StateObject private var manager = AppDataManager()

    private var progress: CGFloat {
        CGFloat(manager.stepCount) / CGFloat(manager.stepGoal)
    }

    var body: some View {

        VStack(spacing: 20) {

            Text("Günlük Aktivite")
                .font(.title.bold())

            VStack(spacing: 10) {

                Text("Adım Sayısı")
                    .foregroundColor(.secondary)

                Text("\(manager.stepCount)")
                    .font(.system(size: 40, weight: .bold))

                ProgressView(value: Double(manager.stepCount),
                             total: Double(manager.stepGoal))
                    .tint(.blue)
            }

            // ÖZGÜN FİKİR: enerji sistemi
            Text(energyText())
                .font(.subheadline)
                .foregroundColor(.green)

            HStack {

                Button("+1000 Adım") {
                    manager.addSteps(1000)
                }

                Button("+3000 Adım") {
                    manager.addSteps(3000)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    func energyText() -> String {

        switch manager.stepCount {
        case 0..<3000:
            return "🪫 Düşük enerji seviyesi"
        case 3000..<7000:
            return "⚡ Orta aktivite seviyesi"
        default:
            return "🔥 Yüksek enerji seviyesi"
        }
    }
}
