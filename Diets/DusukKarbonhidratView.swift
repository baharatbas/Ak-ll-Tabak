//
//  DusukKarbonhidratView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 28.01.2026.
//
import SwiftUI

struct DusukKarbonhidratView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet8")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("Düşük Karbonhidrat Diyeti")
                    .font(.largeTitle)
                    .bold()

                Text("""
Düşük karbonhidrat diyeti, günlük alınan karbonhidrat miktarını sınırlandırarak vücudun enerji kaynağı olarak yağları daha verimli kullanmasını amaçlayan bir beslenme modelidir.

Bu diyet özellikle kan şekeri kontrolünü sağlamak, insülin direncini azaltmak ve kilo kaybını desteklemek amacıyla tercih edilir. Ketojenik diyete göre daha esnektir ve sürdürülebilirliği daha yüksektir.
""")
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Et, tavuk ve balık
• Yumurta
• Sebze (özellikle yeşil sebzeler)
• Sağlıklı yağlar (zeytinyağı, avokado)
• Kuruyemişler
""")

                Divider()

                Text("Kaçınılması Gerekenler")
                    .font(.headline)

                Text("""
• Beyaz ekmek ve hamur işleri
• Şekerli gıdalar
• Gazlı içecekler
• İşlenmiş karbonhidratlar
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Hamileler, emziren anneler ve kronik hastalığı olan bireyler bu diyeti uygulamadan önce mutlaka bir uzmana danışmalıdır.
""")
            }
            .padding()
        }
        .navigationTitle("Düşük Karbonhidrat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DusukKarbonhidratView()
}

