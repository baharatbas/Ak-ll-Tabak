//
//  File.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 16.02.2026.
//

import SwiftUI

struct ChickenSalad: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading , spacing: 20){
                Image("meal1")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(height: 317)
                    .clipped()
                    //.ignoresSafeArea(edges: .top)
                
                
                Text("Chicken Salad")
                    .font(.largeTitle)
                    .bold()
                    .padding()
        
                Text("""
Chicken Salad diyeti, yüksek protein ve düşük karbonhidrat içeriğiyle öne çıkan bir beslenme modelidir. Temelinde ızgara veya haşlanmış tavuk, bol yeşillik ve sağlıklı yağlar bulunur.

Kas kütlesini korumaya yardımcı olur, uzun süre tokluk sağlar ve kilo kontrolünü destekler. Özellikle spor yapan bireyler tarafından tercih edilir.
""")
                .lineSpacing(8)
                .padding()
                Divider() //çizgi çeker
                
                Text("Neler Tüketilir?")
                    .font(.headline)
                    .padding()
                
                Text("""
                • Izgara veya haşlanmış tavuk göğsü
                • Marul, roka, ıspanak gibi yeşillikler
                • Salatalık, domates, biber
                • Zeytinyağı ve limon sosu
                • Avokado ve ceviz gibi sağlıklı yağlar
                """)
                .padding()
                Divider()
                
                Text("Kimler İçin Uygun Değildir?")
                          .font(.headline)
                          .padding()

                      Text("""
      Böbrek rahatsızlığı olanlar veya yüksek protein tüketmesi sakıncalı bireyler için uygun olmayabilir. Uzun süreli uygulanmadan önce uzman görüşü alınmalıdır.
      """)
                      .padding()
                
                

            }
            
            
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

#Preview {
    ChickenSalad()
}
