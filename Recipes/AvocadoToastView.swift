//
//  AvocadoToastView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 21.02.2026.
//


import SwiftUI

struct AvocadoToastView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: - Image
                
                Image("avocadotoast")
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
                    
                    // MARK: - Title
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Avocado Toast")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            
                            Label("Healthy Breakfast",
                                  systemImage: "leaf.fill")
                            
                            Label("High Protein",
                                  systemImage: "flame.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    
                    // MARK: - Description Card
                    
                    InfoCard(
                        title: "About",
                        icon: "fork.knife",
                        content:
"""
Avocado Toast, sağlıklı yağlar ve lif açısından zengin bir kahvaltı seçeneğidir. Avokado ve tam tahıllı ekmek kombinasyonu uzun süre tokluk sağlar.

Enerji verir, kalp sağlığını destekler ve dengeli beslenme için idealdir.
"""
                    )
                    
                    
                    // MARK: - Ingredients
                    
                    InfoCard(
                        title: "Ingredients",
                        icon: "list.bullet",
                        content:
"""
• Tam tahıllı ekmek
• Olgun avokado
• Cherry domates
• Haşlanmış yumurta
• Chia veya susam
"""
                    )
                    
                    
                    // MARK: - Warning
                    
                    InfoCard(
                        title: "Who Should Be Careful?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Avokado alerjisi olan bireyler dikkatli tüketmelidir.

Kalori kontrolü yapan bireyler porsiyon miktarına dikkat etmelidir.
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


// MARK: - Reusable Card

struct InfoCard: View {
    
    let title: String
    let icon: String
    let content: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            HStack(spacing: 10) {
                
                Image(systemName: icon)
                    .font(.title3)
                
                Text(title)
                    .font(.title3.bold())
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(7)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.06),
                radius: 8,
                x: 0,
                y: 4)
    }
}


#Preview {
    NavigationStack {
        AvocadoToastView()
    }
}
