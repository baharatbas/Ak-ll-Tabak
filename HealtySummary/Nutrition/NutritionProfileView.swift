//
//  NutritionProfileView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 16.05.2026.
//

import SwiftUI

struct NutritionProfileView: View {

    @AppStorage("goal_type") var goalType: String = "sağlıklı"
    @State private var selectedGoal = "sağlıklı"

    let options = ["Kilo Verme", "Kas Kazanma", "Sağlıklı Yaşam"]

    var body: some View {

        VStack(spacing: 20) {

            Text("Beslenme Profilin")
                .font(.title.bold())

            Text("Sana özel öneriler için bir seçim yap")
                .foregroundColor(.secondary)

            ForEach(options, id: \.self) { option in

                Button {

                    selectedGoal = option
                    goalType = option

                } label: {

                    HStack {
                        Text(option)
                            .fontWeight(.semibold)

                        Spacer()

                        if selectedGoal == option {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(selectedGoal == option ? Color.green.opacity(0.15) : Color.gray.opacity(0.1))
                    )
                }
            }

            Spacer()
        }
        .padding()
    }
}
