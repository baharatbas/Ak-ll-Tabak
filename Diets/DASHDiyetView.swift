//
//  DASHDiyetView.swift
//  AkıllıTabak
//

import SwiftUI

struct DASHDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet9")
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
                        
                        Text("DASH Diyeti")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            Label("Tansiyon Dostu",
                                  systemImage: "heart.text.square.fill")
                            
                            Label("Kalp Sağlığı",
                                  systemImage: "heart.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
DASH diyeti, yüksek tansiyonu düşürmek amacıyla geliştirilmiş bilimsel bir beslenme programıdır. Sodyum tüketimini azaltırken potasyum, kalsiyum ve magnezyum açısından zengin besinleri ön plana çıkarır.

Kan basıncını dengelemeye yardımcı olur ve kalp sağlığını destekler.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Sebze ve meyveler
• Az yağlı süt ürünleri
• Tam tahıllar
• Balık ve tavuk
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Böbrek hastalığı olan bireyler potasyum miktarına dikkat ederek uygulamalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("DASH Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DASHDiyetView()
    }
}
