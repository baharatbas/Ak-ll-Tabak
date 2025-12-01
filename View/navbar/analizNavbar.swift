//
//  searchNavbar.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 15.10.2025.
//

import SwiftUI



import SwiftUI
import Charts   // iOS 16+ için grafikleri kullanacağız

struct analizNavbar: View {
    
    // Örnek veri
    let weeklyCalories: [DailyCalorie] = [
        .init(day: "Mon", value: 1800),
        .init(day: "Tue", value: 2100),
        .init(day: "Wed", value: 1950),
        .init(day: "Thu", value: 2300),
        .init(day: "Fri", value: 1750),
        .init(day: "Sat", value: 2500),
        .init(day: "Sun", value: 2000)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                
                // MARK: Title
                Text("Your Analysis")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                
                
                // MARK: Daily Summary Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("Today's Summary")
                        .font(.headline)
                    
                    HStack {
                        SummaryItem(title: "Calories", value: "1420 kcal", color: .orange)
                        SummaryItem(title: "Protein", value: "72 g", color: .blue)
                        SummaryItem(title: "Carbs", value: "140 g", color: .green)
                        SummaryItem(title: "Fat", value: "45 g", color: .purple)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding(.horizontal)
                
                
                // MARK: Weekly Chart
                VStack(alignment: .leading, spacing: 12) {
                    Text("Weekly Calorie Intake")
                        .font(.headline)
                    
                    Chart(weeklyCalories) { day in
                        BarMark(
                            x: .value("Day", day.day),
                            y: .value("Calories", day.value)
                        )
                        .cornerRadius(8)
                    }
                    .frame(height: 200)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding(.horizontal)
                
                
                // MARK: Macro Pie Chart (Custom)
                VStack(alignment: .leading, spacing: 15) {
                    Text("Macro Distribution")
                        .font(.headline)
                    
                    HStack {
                        PieChartView(protein: 30, carbs: 45, fat: 25)
                            .frame(width: 150, height: 150)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Legend(color: .blue, text: "Protein 30%")
                            Legend(color: .green, text: "Carbs 45%")
                            Legend(color: .purple, text: "Fat 25%")
                        }
                        .font(.subheadline)
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding(.horizontal)
                
                
                // MARK: AI Suggestions
                VStack(alignment: .leading, spacing: 10) {
                    Text("AI Suggestions For You")
                        .font(.headline)
                    
                    Text("• Öğle yemeğinde protein alımın düşük kaldı, tavuk/ton balığı tercih edebilirsin.\n• Bugün karbonhidrat alımın yükseldi, akşam öğününde sebze ağırlıklı ilerlemen daha dengeli olacaktır.\n• Haftalık kalori hedefinin %75’ine ulaştın, ilerlemen çok iyi!")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding(.horizontal)
                
                
                Spacer().frame(height: 40)
            }
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
        VStack(spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .bold()
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
        }
        .frame(maxWidth: .infinity)
    }
}

struct Legend: View {
    let color: Color
    let text: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 12, height: 12)
            Text(text)
        }
    }
}

struct PieChartView: View {
    let protein: Double
    let carbs: Double
    let fat: Double
    
    var body: some View {
        ZStack {
            Circle().trim(from: 0, to: protein/100)
                .stroke(.blue, lineWidth: 20)
                .rotationEffect(.degrees(-90))
            
            Circle().trim(from: protein/100, to: (protein+carbs)/100)
                .stroke(.green, lineWidth: 20)
                .rotationEffect(.degrees(-90))
            
            Circle().trim(from: (protein+carbs)/100, to: 1.0)
                .stroke(.purple, lineWidth: 20)
                .rotationEffect(.degrees(-90))
        }
    }
}


#Preview {
    analizNavbar()
}
