//
//  HerbOmelette.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 16.02.2026.
//

import SwiftUI

struct HerbOmelette: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                Image("meal2")
                    .resizable()
                    .frame(height: 350)
                    .cornerRadius(20)
                
                Text("Herb Omelette")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                                Text("""
                Herb Omelette, yüksek protein içeriği ve taze yeşilliklerle zenginleştirilmiş sağlıklı bir kahvaltı alternatifidir. Yumurta, maydanoz, dereotu ve taze baharatlarla hazırlanır.

                Gün boyu enerji sağlar, kas gelişimini destekler ve düşük karbonhidratlı beslenenler için ideal bir seçenektir.
                """)
                                .lineSpacing(8)
                                .padding()

                                Divider()

                                Text("Neler Tüketilir?")
                                    .font(.headline)
                                    .padding()

                                Text("""
                • Yumurta
                • Maydanoz ve dereotu
                • Taze soğan
                • Ispanak veya roka
                • Az miktarda zeytinyağı
                """)
                                .padding()

                                Divider()

                                Text("Kimler İçin Uygun Değildir?")
                                    .font(.headline)
                                    .padding()

                                Text("""
                Yumurta alerjisi olan bireyler için uygun değildir. Kolesterol problemi olan bireyler tüketim miktarına dikkat etmelidir.
                """)
                                .padding()
                
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    HerbOmelette()
}
