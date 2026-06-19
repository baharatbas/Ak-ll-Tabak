//
//  FoodAccuracyView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 11.06.2026.
//

import Foundation
import SwiftUI

struct FoodAccuracyView: View{
    let gorsel: UIImage?
    @State private var analizeSayfa = false
    @State private var secilenGorsel: UIImage?

    
    @State private var kapTuru = "Düz Tabak"
    @State private var anaYemek = ""
    @State private var ekMalzemeler = ""
    @State private var porsiyon = "Orta"
    @State private var pisirmeSekli = "Izgara"
    
    let kapTurleri = ["Düz Tabak", "Çukur Tabak", "Kase", "Bardak", "Saklama Kabı"]
    let porsiyonlar = ["Küçük", "Orta", "Büyük"]
    let pisirmeSekilleri = ["Izgara", "Haşlama", "Fırın", "Kızartma", "Çiğ"]
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    
                    if let gorsel {
                        Image(uiImage: gorsel)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 230)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 26))
                    }
                    
                    bilgiKarti
                    
                    secimKarti(
                        baslik: "Kap Türü",
                        icon: "takeoutbag.and.cup.and.straw.fill",
                        secenekler: kapTurleri,
                        secim: $kapTuru
                    )
                    
                    metinKarti
                    
                    secimKarti(
                        baslik: "Porsiyon",
                        icon: "chart.pie.fill",
                        secenekler: porsiyonlar,
                        secim: $porsiyon
                    )
                    
                    secimKarti(
                        baslik: "Pişirme Şekli",
                        icon: "flame.fill",
                        secenekler: pisirmeSekilleri,
                        secim: $pisirmeSekli
                    )
                    
                    Button {
                        analizeSayfa = true
                    } label: {
                        HStack {
                            Image(systemName: "sparkles")
                            Text("Analizi Başlat")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                }
                .padding(20)
            }
            .background(
                LinearGradient(
                    colors: [
                        Color.black,
                        Color.green.opacity(0.85),
                        Color.white.opacity(0.9)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationTitle("Yemek Doğrulama")
            .navigationBarTitleDisplayMode(.inline)

            .navigationDestination(isPresented: $analizeSayfa) {
                analizeGonder(gorsel: gorsel)
            }
        }
    }
        
        private var bilgiKarti: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text("Yemek bilgilerini doğrula")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                
                Text("Kalori tahminini daha doğru yapmak için kap türü, içerik ve porsiyon bilgisini gir.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        
        private var metinKarti: some View {
            VStack(alignment: .leading, spacing: 14) {
                Text("İçindekiler")
                    .font(.headline)
                    .foregroundStyle(.white)
                
                TextField("Ana yemek: Tavuk, pilav...", text: $anaYemek)
                    .textFieldStyleUI()
                
                TextField("Ek malzemeler: Yoğurt, sos, yağ...", text: $ekMalzemeler)
                    .textFieldStyleUI()
            }
            .padding(20)
            .background(Color.black.opacity(0.22))
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        
        private func secimKarti(
            baslik: String,
            icon: String,
            secenekler: [String],
            secim: Binding<String>
        ) -> some View {
            VStack(alignment: .leading, spacing: 14) {
                Label(baslik, systemImage: icon)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Picker(baslik, selection: secim) {
                    ForEach(secenekler, id: \.self) { item in
                        Text(item).tag(item)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding(20)
            .background(Color.black.opacity(0.22))
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
    }

   extension View {
       func textFieldStyleUI() -> some View {
           self
               .padding()
               .background(Color.white.opacity(0.95))
               .foregroundStyle(.black)
               .clipShape(RoundedRectangle(cornerRadius: 16))
       }
    
}
