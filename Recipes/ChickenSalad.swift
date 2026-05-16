//
//  ChickenSalad.swift
//  AkıllıTabak
//

import SwiftUI

struct ChickenSalad: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("meal1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 317)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.15),
                            radius: 10,
                            x: 0,
                            y: 6)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Chicken Salad")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            
                            Label("High Protein",
                                  systemImage: "flame.fill")
                            
                            Label("Fitness Meal",
                                  systemImage: "figure.run")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    
                    InfoCard(
                        title: "About",
                        icon: "fork.knife",
                        content:
"""
Chicken Salad diyeti, yüksek protein ve düşük karbonhidrat içeriğiyle öne çıkan bir beslenme modelidir.

Kas kütlesini korumaya yardımcı olur, uzun süre tokluk sağlar ve kilo kontrolünü destekler.
"""
                    )
                    
                    
                    InfoCard(
                        title: "Ingredients",
                        icon: "list.bullet",
                        content:
"""
• Izgara tavuk göğsü
• Marul ve roka
• Domates ve salatalık
• Zeytinyağı & limon
• Avokado ve ceviz
"""
                    )
                    
                    
                    InfoCard(
                        title: "Who Should Be Careful?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Böbrek rahatsızlığı olan bireyler ve yüksek protein tüketmesi sakıncalı kişiler dikkatli tüketmelidir.
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
        ChickenSalad()
    }
}
