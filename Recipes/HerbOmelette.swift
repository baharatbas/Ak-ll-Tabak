//
//  HerbOmelette.swift
//  AkıllıTabak
//

import SwiftUI

struct HerbOmelette: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("meal2")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.15),
                            radius: 10,
                            x: 0,
                            y: 6)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Herb Omelette")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            
                            Label("Healthy Breakfast",
                                  systemImage: "leaf.fill")
                            
                            Label("Low Carb",
                                  systemImage: "heart.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    
                    InfoCard(
                        title: "About",
                        icon: "fork.knife",
                        content:
"""
Herb Omelette, yüksek protein içeriği ve taze yeşilliklerle zenginleştirilmiş sağlıklı bir kahvaltı alternatifidir.

Gün boyu enerji sağlar ve kas gelişimini destekler.
"""
                    )
                    
                    
                    InfoCard(
                        title: "Ingredients",
                        icon: "list.bullet",
                        content:
"""
• Yumurta
• Maydanoz ve dereotu
• Taze soğan
• Ispanak veya roka
• Zeytinyağı
"""
                    )
                    
                    
                    InfoCard(
                        title: "Who Should Be Careful?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Yumurta alerjisi olan bireyler için uygun değildir. Kolesterol problemi olan bireyler porsiyon kontrolü yapmalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HerbOmelette()
    }
}
