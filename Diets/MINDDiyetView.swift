//
//  MINDDiyetView.swift
//  AkıllıTabak
//

import SwiftUI

struct MINDDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet10")
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
                        
                        Text("MIND Diyeti")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            Label("Beyin Sağlığı",
                                  systemImage: "brain.head.profile")
                            
                            Label("Dengeli",
                                  systemImage: "leaf.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
MIND diyeti, beyin sağlığını korumayı amaçlayan Akdeniz ve DASH diyetlerinin birleşimidir.

Alzheimer riskini azaltmaya yardımcı olabilir.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Yeşil yapraklı sebzeler
• Yaban mersini
• Balık
• Zeytinyağı
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Genel olarak güvenlidir, ancak özel hastalıkları olanlar uzman görüşü almalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("MIND Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MINDDiyetView()
    }
}
