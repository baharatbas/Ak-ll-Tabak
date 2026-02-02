//
//  GlutensizDiyetView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//

import SwiftUI

struct GlutensizDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet7")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("Glutensiz Diyet")
                    .font(.largeTitle)
                    .bold()

                Text("""
Glutensiz diyet, buğday, arpa ve çavdar gibi gluten içeren besinlerin tamamen çıkarılmasını hedefler.

Çölyak hastaları ve gluten hassasiyeti olanlar için zorunludur.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Pirinç
• Mısır
• Patates
• Sebze ve meyveler
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Gluten hassasiyeti olmayan bireyler için gerekli değildir.
""")
            }
            .padding()
        }
        .navigationTitle("Glutensiz Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

