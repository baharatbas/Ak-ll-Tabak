//
//  DASHDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//

import SwiftUI

struct DASHDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet9")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("DASH Diyeti")
                    .font(.largeTitle)
                    .bold()

                Text("""
DASH diyeti, yüksek tansiyonu düşürmek amacıyla geliştirilmiş bilimsel bir beslenme programıdır. Sodyum tüketimini azaltırken potasyum, kalsiyum ve magnezyum açısından zengin besinleri ön plana çıkarır.

Kan basıncını dengelemeye yardımcı olur ve kalp sağlığını destekler.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Sebze ve meyveler
• Az yağlı süt ürünleri
• Tam tahıllar
• Balık ve tavuk
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Böbrek hastalığı olan bireyler potasyum miktarına dikkat ederek uygulamalıdır.
""")
            }
            .padding()
        }
        .navigationTitle("DASH Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

