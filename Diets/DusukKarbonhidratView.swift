//
//  DusukKarbonhidratView.swift
//  AkıllıTabak
//

import SwiftUI

struct DusukKarbonhidratView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet8")
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
                        
                        Text("Düşük Karbonhidrat Diyeti")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            Label("Low Carb",
                                  systemImage: "leaf.fill")
                            
                            Label("Kan Şekeri",
                                  systemImage: "drop.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
Düşük karbonhidrat diyeti, günlük alınan karbonhidrat miktarını sınırlandırarak vücudun enerji kaynağı olarak yağları daha verimli kullanmasını amaçlayan bir beslenme modelidir.

Bu diyet özellikle kan şekeri kontrolünü sağlamak, insülin direncini azaltmak ve kilo kaybını desteklemek amacıyla tercih edilir. Ketojenik diyete göre daha esnektir ve sürdürülebilirliği daha yüksektir.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Et, tavuk ve balık
• Yumurta
• Sebze (özellikle yeşil sebzeler)
• Sağlıklı yağlar (zeytinyağı, avokado)
• Kuruyemişler
"""
                    )
                    
                    InfoCard(
                        title: "Kaçınılması Gerekenler",
                        icon: "xmark.circle.fill",
                        content:
"""
• Beyaz ekmek ve hamur işleri
• Şekerli gıdalar
• Gazlı içecekler
• İşlenmiş karbonhidratlar
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Hamileler, emziren anneler ve kronik hastalığı olan bireyler bu diyeti uygulamadan önce mutlaka bir uzmana danışmalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Düşük Karbonhidrat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DusukKarbonhidratView()
    }
}
