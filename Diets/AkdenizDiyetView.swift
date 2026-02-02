//
//  AkdenizDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//

import SwiftUI

struct AkdenizDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet2")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)
                    

                Text("Akdeniz Diyeti")
                    .font(.largeTitle)
                    .bold()

                Text("""
Akdeniz diyeti, geleneksel Akdeniz ülkelerinin beslenme alışkanlıklarını temel alan sağlıklı ve dengeli bir diyet modelidir. Zeytinyağı, sebze, meyve, balık ve tam tahıllar bu diyetin temelini oluşturur.

Uzun vadede kalp-damar hastalıkları riskini azaltır, yaşam kalitesini artırır ve sürdürülebilir bir beslenme sunar.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Zeytinyağı
• Sebze ve meyveler
• Balık ve deniz ürünleri
• Tam tahıllar
• Kuruyemişler
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Genel olarak her yaş grubu için uygundur. Ancak gıda alerjisi olan bireyler dikkatli olmalıdır.
""")
            }
            .padding()
        }
        .navigationTitle("Akdeniz Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

