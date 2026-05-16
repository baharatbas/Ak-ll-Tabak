//
//  QuinoaVeggieView.swift
//  AkıllıTabak
//

import SwiftUI

struct QuinoaVeggieView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("quinoabowl")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 420, height: 300)
                    .clipped()
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.15),
                            radius: 10,
                            x: 0,
                            y: 6)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Quinoa Veggie Bowl")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            
                            Label("Vegan",
                                  systemImage: "leaf.fill")
                            
                            Label("High Fiber",
                                  systemImage: "heart.text.square.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    
                    InfoCard(
                        title: "About",
                        icon: "fork.knife",
                        content:
"""
Quinoa Veggie Bowl, bitkisel protein açısından zengin ve dengeli bir öğündür.

Lif oranı yüksektir ve sindirimi destekler.
"""
                    )
                    
                    
                    InfoCard(
                        title: "Ingredients",
                        icon: "list.bullet",
                        content:
"""
• Haşlanmış quinoa
• Izgara kabak ve biber
• Nohut
• Zeytinyağı & limon
• Maydanoz
"""
                    )
                    
                    
                    InfoCard(
                        title: "Who Should Be Careful?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Tahıl hassasiyeti olan bireyler dikkatli tüketmelidir.
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
        QuinoaVeggieView()
    }
}
