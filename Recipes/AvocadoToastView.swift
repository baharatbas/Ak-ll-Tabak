//
//  AvocadoToastView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 21.02.2026.
//


import SwiftUI

struct AvocadoToastView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("avocadotoast")
                    .resizable()
                    .frame(width: 420, height: 300)
                    .cornerRadius(24)

                Text("Avocado Toast")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                Text("""
Avocado Toast, sağlıklı yağlar ve lif açısından zengin bir kahvaltı seçeneğidir. Avokado ve tam tahıllı ekmek kombinasyonu uzun süre tokluk sağlar.

Enerji verir, kalp sağlığını destekler ve dengeli beslenme için idealdir.
""")
                .lineSpacing(8)
                .padding()

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)
                    .padding()

                Text("""
• Tam tahıllı ekmek
• Olgun avokado
• Cherry domates
• Haşlanmış yumurta (isteğe bağlı)
• Chia veya susam
""")
                .padding()

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)
                    .padding()

                Text("""
Avokado alerjisi olan bireyler dikkatli tüketmelidir. Kalori kontrolü yapan bireyler porsiyona dikkat etmelidir.
""")
                .padding()
            }
            
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    AvocadoToastView()
}
