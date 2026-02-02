//
//  AralikliOrucView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//
import SwiftUI

struct AralikliOrucView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet3")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("Aralıklı Oruç")
                    .font(.largeTitle)
                    .bold()

                Text("""
Aralıklı oruç, günün belirli saatlerinde yemek yemeyi, kalan saatlerde ise kalori alımını durdurmayı esas alır. En yaygın yöntemler 16:8 ve 18:6 sistemleridir.

Bu yöntem insülin hassasiyetini artırabilir ve kilo kontrolüne yardımcı olabilir.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Protein ağırlıklı öğünler
• Sebzeler
• Sağlıklı yağlar
• Bol su
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Hamileler, yeme bozukluğu geçmişi olanlar ve diyabet hastaları için uygun değildir.
""")
            }
            .padding()
        }
        .navigationTitle("Aralıklı Oruç")
        .navigationBarTitleDisplayMode(.inline)
    }
}
