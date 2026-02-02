//
//  VejetaryenDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//

import SwiftUI

struct VejetaryenDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet5")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("Vejetaryen Diyet")
                    .font(.largeTitle)
                    .bold()

                Text("""
Vejetaryen diyet, et ve balık tüketimini dışlayan, bitkisel ağırlıklı bir beslenme biçimidir. Süt ürünleri ve yumurta bazı vejetaryen türlerinde tüketilebilir.

Doğru planlandığında kalp sağlığını destekler ve çevresel etkileri azaltır.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Sebze ve meyveler
• Baklagiller
• Süt ve süt ürünleri
• Yumurta
• Tam tahıllar
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Protein ihtiyacını karşılamakta zorlanan bireyler uzman desteği almalıdır.
""")
            }
            .padding()
        }
        .navigationTitle("Vejetaryen Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

