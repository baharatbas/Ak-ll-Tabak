//
//  VejetaryenDiyetView.swift
//  AkıllıTabak
//

import SwiftUI

struct VejetaryenDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet5")
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
                        
                        Text("Vejetaryen Diyet")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            Label("Bitkisel Ağırlıklı",
                                  systemImage: "leaf.fill")
                            
                            Label("Et İçermez",
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
Vejetaryen diyet, et ve balık tüketimini dışlayan, bitkisel ağırlıklı bir beslenme biçimidir. Süt ürünleri ve yumurta bazı vejetaryen türlerinde tüketilebilir.

Doğru planlandığında kalp sağlığını destekler ve çevresel etkileri azaltır.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Sebze ve meyveler
• Baklagiller
• Süt ve süt ürünleri
• Yumurta
• Tam tahıllar
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Protein ihtiyacını karşılamakta zorlanan bireyler uzman desteği almalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Vejetaryen Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        VejetaryenDiyetView()
    }
}
