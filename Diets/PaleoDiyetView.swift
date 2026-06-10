//
//  PaleoDiyetView.swift
//  AkıllıTabak
//

import SwiftUI

struct PaleoDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet6")
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
                        
                        Text("Paleo Diyeti")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            Label("Doğal Beslenme",
                                  systemImage: "leaf.fill")
                            
                            Label("İşlenmemiş Gıda",
                                  systemImage: "checkmark.seal.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
Paleo diyeti, taş devri insanlarının beslenme alışkanlıklarını temel alır. İşlenmiş gıdalar tamamen dışlanır.

Amaç doğal ve katkısız besinlerle metabolizmayı desteklemektir.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Et ve balık
• Sebzeler
• Meyveler
• Kuruyemişler
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Süt ürünlerinden vazgeçemeyen bireyler için zorlayıcı olabilir.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Paleo Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        PaleoDiyetView()
    }
}
