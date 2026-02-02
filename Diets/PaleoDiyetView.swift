//
//  PaleoDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//


import SwiftUI

struct PaleoDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet6")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("Paleo Diyeti")
                    .font(.largeTitle)
                    .bold()

                Text("""
Paleo diyeti, taş devri insanlarının beslenme alışkanlıklarını temel alır. İşlenmiş gıdalar tamamen dışlanır.

Amaç doğal ve katkısız besinlerle metabolizmayı desteklemektir.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Et ve balık
• Sebzeler
• Meyveler
• Kuruyemişler
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Süt ürünlerinden vazgeçemeyen bireyler için zorlayıcı olabilir.
""")
            }
            .padding()
        }
        .navigationTitle("Paleo Diyeti")
        .navigationBarTitleDisplayMode(.inline)
    }
}

