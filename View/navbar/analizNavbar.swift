import SwiftUI
import Charts
import SwiftData

struct analizNavbar: View {

    @Query(sort: \MealAnalysisRecord.createdAt, order: .reverse)
    private var records: [MealAnalysisRecord]

    private var todayRecords: [MealAnalysisRecord] {
        records.filter {
            Calendar.current.isDateInToday($0.createdAt)
        }
    }

    private var todayTotalCalories: Int {
        todayRecords.reduce(0) { $0 + $1.calories }
    }

    private var todayCalories: String {
        "\(todayTotalCalories) kcal"
    }

    private var todayProtein: String {
        "\(Int(todayRecords.reduce(0) { $0 + $1.protein })) g"
    }

    private var todayCarbs: String {
        "\(Int(todayRecords.reduce(0) { $0 + $1.carbs })) g"
    }

    private var todayFat: String {
        "\(Int(todayRecords.reduce(0) { $0 + $1.fat })) g"
    }

    private var weeklyCalories: [DailyCalorie] {
        let calendar = Calendar.current

        return (0..<7).reversed().map { offset in
            let date = calendar.date(byAdding: .day, value: -offset, to: Date()) ?? Date()

            let total = records
                .filter { calendar.isDate($0.createdAt, inSameDayAs: date) }
                .reduce(0) { $0 + $1.calories }

            let dayName = date.formatted(.dateTime.weekday(.abbreviated))

            return DailyCalorie(day: dayName, value: Double(total))
        }
    }

    private var macroPercentages: (protein: Double, carbs: Double, fat: Double) {
        let protein = todayRecords.reduce(0) { $0 + $1.protein }
        let carbs = todayRecords.reduce(0) { $0 + $1.carbs }
        let fat = todayRecords.reduce(0) { $0 + $1.fat }

        let total = protein + carbs + fat

        guard total > 0 else {
            return (0, 0, 0)
        }

        return (
            protein: protein / total * 100,
            carbs: carbs / total * 100,
            fat: fat / total * 100
        )
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(.systemBackground),
                    Color.green.opacity(0.05),
                    Color.orange.opacity(0.03)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 22) {
                    üstBaşlık
                    günlükÖzetKartı
                    haftalıkKaloriGrafiği
                    makroDağılımKartı
                    aiÖneriKartı

                    Spacer()
                        .frame(height: 20)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

private extension analizNavbar {

    var üstBaşlık: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Your Analysis")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            Text("Günlük beslenme verilerini incele, haftalık gidişatını takip et ve sana özel önerileri görüntüle.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineSpacing(3)
        }
    }

    var günlükÖzetKartı: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Today's Summary")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("Bugünkü temel besin değerlerin")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "heart.text.square.fill")
                    .font(.title2)
                    .foregroundColor(.green)
            }

            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 12),
                    GridItem(.flexible(), spacing: 12)
                ],
                spacing: 12
            ) {
                SummaryItem(title: "Calories", value: todayCalories, color: .orange)
                SummaryItem(title: "Protein", value: todayProtein, color: .blue)
                SummaryItem(title: "Carbs", value: todayCarbs, color: .green)
                SummaryItem(title: "Fat", value: todayFat, color: .purple)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 26)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 14, x: 0, y: 8)
        )
    }

    var haftalıkKaloriGrafiği: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Weekly Calorie Intake")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("Haftalık kalori tüketim dağılımın")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chart.bar.fill")
                    .font(.title2)
                    .foregroundColor(.orange)
            }

            Chart(weeklyCalories) { day in
                BarMark(
                    x: .value("Day", day.day),
                    y: .value("Calories", day.value)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [.green.opacity(0.9), .orange.opacity(0.8)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .cornerRadius(8)
                .annotation(position: .top) {
                    Text("\(Int(day.value))")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .frame(height: 240)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 26)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 14, x: 0, y: 8)
        )
    }

    var makroDağılımKartı: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Macro Distribution")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("Protein, karbonhidrat ve yağ oranların")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chart.pie.fill")
                    .font(.title2)
                    .foregroundColor(.purple)
            }

            HStack(spacing: 20) {
                ZStack {
                    PieChartView(
                        protein: macroPercentages.protein,
                        carbs: macroPercentages.carbs,
                        fat: macroPercentages.fat
                    )
                    .frame(width: 170, height: 170)

                    VStack(spacing: 4) {
                        Text("\(todayTotalCalories)")
                            .font(.title2)
                            .fontWeight(.bold)

                        Text("kcal")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Legend(color: .blue, text: "Protein \(Int(macroPercentages.protein))%")
                    Legend(color: .green, text: "Carbs \(Int(macroPercentages.carbs))%")
                    Legend(color: .purple, text: "Fat \(Int(macroPercentages.fat))%")
                }

                Spacer()
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 26)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 14, x: 0, y: 8)
        )
    }

    var aiÖneriKartı: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("AI Suggestions For You")
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("Günlük verilerine göre öneriler")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "sparkles")
                    .font(.title2)
                    .foregroundColor(.yellow)
            }

            VStack(alignment: .leading, spacing: 12) {
                if todayRecords.isEmpty {
                    öneriSatırı(
                        ikon: "camera.viewfinder",
                        metin: "Henüz bugün analiz yapılmadı. Bir yemek fotoğrafı analiz ederek günlük istatistiklerini başlatabilirsin."
                    )
                } else {
                    öneriSatırı(
                        ikon: "flame.fill",
                        metin: "Bugün toplam \(todayTotalCalories) kcal aldın. Günün kalan öğünlerini buna göre dengeleyebilirsin."
                    )

                    öneriSatırı(
                        ikon: "chart.pie.fill",
                        metin: "Makro dağılımın: protein %\(Int(macroPercentages.protein)), karbonhidrat %\(Int(macroPercentages.carbs)), yağ %\(Int(macroPercentages.fat))."
                    )

                    öneriSatırı(
                        ikon: "checkmark.seal.fill",
                        metin: "Analizlerin başarıyla kaydediliyor. Haftalık grafik, yeni analiz yaptıkça otomatik güncellenecek."
                    )
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 26)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.06), radius: 14, x: 0, y: 8)
        )
    }

    func öneriSatırı(ikon: String, metin: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.green.opacity(0.12))
                    .frame(width: 36, height: 36)

                Image(systemName: ikon)
                    .foregroundColor(.green)
                    .font(.subheadline)
            }

            Text(metin)
                .font(.subheadline)
                .foregroundColor(.primary)
                .lineSpacing(3)

            Spacer()
        }
    }
}

struct DailyCalorie: Identifiable {
    let id = UUID()
    let day: String
    let value: Double
}

struct SummaryItem: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(color)
                    .frame(width: 10, height: 10)

                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Spacer()
            }

            Text(value)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, minHeight: 82, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(color.opacity(0.08))
        )
    }
}

struct Legend: View {
    let color: Color
    let text: String

    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(color)
                .frame(width: 12, height: 12)

            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}

struct PieChartView: View {
    let protein: Double
    let carbs: Double
    let fat: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.12), lineWidth: 22)

            Circle()
                .trim(from: 0, to: protein / 100)
                .stroke(.blue, style: StrokeStyle(lineWidth: 22, lineCap: .round))
                .rotationEffect(.degrees(-90))

            Circle()
                .trim(from: protein / 100, to: (protein + carbs) / 100)
                .stroke(.green, style: StrokeStyle(lineWidth: 22, lineCap: .round))
                .rotationEffect(.degrees(-90))

            Circle()
                .trim(from: (protein + carbs) / 100, to: 1.0)
                .stroke(.purple, style: StrokeStyle(lineWidth: 22, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

#Preview {
    analizNavbar()
        .modelContainer(for: MealAnalysisRecord.self, inMemory: true)
}
