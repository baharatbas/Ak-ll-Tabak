//
//  GlutensizDiyetView.swift
//  AkıllıTabak
//

import SwiftUI

struct GlutensizDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet7")
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
                        
                        Text("Glutensiz Diyet")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            Label("Glutensiz",
                                  systemImage: "checkmark.seal.fill")
                            
                            Label("Hassas Beslenme",
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
Glutensiz diyet, buğday, arpa ve çavdar gibi gluten içeren besinlerin tamamen çıkarılmasını hedefler.

Çölyak hastaları ve gluten hassasiyeti olanlar için zorunludur.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Pirinç
• Mısır
• Patates
• Sebze ve meyveler
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Gluten hassasiyeti olmayan bireyler için gerekli değildir.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Glutensiz Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GlutensizDiyetView()
    }
}
