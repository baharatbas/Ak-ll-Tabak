//
//  AkdenizDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//

import SwiftUI

struct AkdenizDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet2")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .cornerRadius(30)
                    .shadow(
                        color: .black.opacity(0.15),
                        radius: 10,
                        x: 0,
                        y: 6
                    )
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Akdeniz Diyeti")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            
                            Label(
                                "Dengeli Beslenme",
                                systemImage: "leaf.fill"
                            )
                            
                            Label(
                                "Kalp Dostu",
                                systemImage: "heart.fill"
                            )
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
Akdeniz diyeti, geleneksel Akdeniz ülkelerinin beslenme alışkanlıklarını temel alan sağlıklı ve dengeli bir diyet modelidir. Zeytinyağı, sebze, meyve, balık ve tam tahıllar bu diyetin temelini oluşturur.

Uzun vadede kalp-damar hastalıkları riskini azaltır, yaşam kalitesini artırır ve sürdürülebilir bir beslenme sunar.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Zeytinyağı
• Sebze ve meyveler
• Balık ve deniz ürünleri
• Tam tahıllar
• Kuruyemişler
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Genel olarak her yaş grubu için uygundur. Ancak gıda alerjisi olan bireyler dikkatli olmalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Akdeniz Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AkdenizDiyetView()
    }
}
