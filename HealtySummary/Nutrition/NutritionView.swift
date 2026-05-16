import SwiftUI
struct NutritionView: View {

    @AppStorage("goal_type") var goalType: String = "Sağlıklı Yaşam"

    var body: some View {

        VStack(spacing: 20) {

            Text("Beslenme Önerileri")
                .font(.title.bold())

            Text("Hedef: \(goalType)")
                .foregroundColor(.secondary)

            VStack(spacing: 15) {

                ForEach(recommendations(), id: \.self) { item in

                    Text(item)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(12)
                }
            }

            Spacer()
        }
        .padding()
    }

    func recommendations() -> [String] {

        switch goalType {

        case "Kilo Verme":
            return [
                "🥗 Daha fazla protein tüket",
                "💧 Günde 2-3 litre su iç",
                "🍞 Rafine karbonhidratları azalt"
            ]

        case "Kas Kazanma":
            return [
                "🍗 Protein ağırlıklı beslen",
                "🏋️ Egzersiz sonrası beslenmeyi atlama",
                "🥜 Sağlıklı yağlar ekle"
            ]

        default:
            return [
                "🥦 Dengeli tabak oluştur",
                "🍎 Taze sebze ve meyve tüket",
                "⚖️ Porsiyon kontrolüne dikkat et"
            ]
        }
    }
}
