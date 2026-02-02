//
//  MINDDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//

import SwiftUI

struct MINDDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet10")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("MIND Diyeti")
                    .font(.largeTitle)
                    .bold()

                Text("""
MIND diyeti, beyin sağlığını korumayı amaçlayan Akdeniz ve DASH diyetlerinin birleşimidir.

Alzheimer riskini azaltmaya yardımcı olabilir.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Yeşil yapraklı sebzeler
• Yaban mersini
• Balık
• Zeytinyağı
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Genel olarak güvenlidir, ancak özel hastalıkları olanlar uzman görüşü almalıdır.
""")
            }
            .padding()
        }
        .navigationTitle("MIND Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

