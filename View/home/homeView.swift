//
//  homeView.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 24.10.2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                // Uygulama başlığı
                Text("🥗 AkıllıTabak")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 40)
                
                // Hoş geldin yazısı
                Text("Sağlıklı beslenmenin akıllı yolu! 🌿")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Görsel (örnek)
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.green.opacity(0.8))
                    .padding()
                
                // Ana butonlar
                VStack(spacing: 15) {
                    NavigationLink(destination: Diyet()) {
                        Text("🍽️ Kategorilere Git")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 2)
                    }
                    
                    NavigationLink(destination: searchNavbar()) {
                        Text("🔍 Tarif Ara")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 2)
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .navigationTitle("Ana Sayfa")
        }
    }
}

#Preview {
    HomeView()
}

