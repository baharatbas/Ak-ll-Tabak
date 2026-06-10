//
//  VeganDiyetView.swift
//  AkıllıTabak
//

import SwiftUI

struct VeganDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet4")
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
                        
                        Text("Vegan Diyet")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            Label("Bitkisel",
                                  systemImage: "leaf.fill")
                            
                            Label("Hayvansal Ürün Yok",
                                  systemImage: "xmark.circle.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
Vegan diyet, tüm hayvansal ürünleri tamamen dışlayan bitkisel temelli bir beslenme biçimidir. Etik, çevresel ve sağlık nedenleriyle tercih edilir.

Doğru planlandığında kalp sağlığını destekler ve çevresel etkisi düşüktür.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Sebze ve meyveler
• Baklagiller
• Kuruyemişler
• Bitkisel proteinler
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
B12 vitamini eksikliği riski olanlar takviye almadan uygulamamalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Vegan Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        VeganDiyetView()
    }
}
