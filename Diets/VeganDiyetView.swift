//
//  VeganDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//

import SwiftUI

struct VeganDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet4")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("Vegan Diyet")
                    .font(.largeTitle)
                    .bold()

                Text("""
Vegan diyet, tüm hayvansal ürünleri tamamen dışlayan bitkisel temelli bir beslenme biçimidir. Etik, çevresel ve sağlık nedenleriyle tercih edilir.

Doğru planlandığında kalp sağlığını destekler ve çevresel etkisi düşüktür.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Sebze ve meyveler
• Baklagiller
• Kuruyemişler
• Bitkisel proteinler
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
B12 vitamini eksikliği riski olanlar takviye almadan uygulamamalıdır.
""")
            }
            .padding()
        }
        .navigationTitle("Vegan Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

