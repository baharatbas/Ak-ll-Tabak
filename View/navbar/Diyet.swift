//
//  Diyet.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 27.11.2025.
//

import Foundation
import SwiftUI
struct Diyet: View {
    let diet:[Dıyet] = [
        Dıyet(name: "Ketojenik Diyet", describe: "Ketojenik diyet, karbonhidratı çok düşük tutup yağ tüketimini artırarak vücudun yağ yakımını hızlandırmayı amaçlar.", image: "diyet1",color: .orange),
        Dıyet(name: "Akdeniz Diyeti", describe: "Akdeniz diyeti, sebze, meyve, tam tahıl ve sağlıklı yağlara dayalı kalp dostu bir beslenme modelidir. Uzun vadede sağlıklı yaşamı destekler.", image: "diyet2",color: .blue),
        Dıyet(name: "Aralıklı Oruç Diyeti", describe: "Aralıklı oruç, günün belirli saatlerinde yemek yemeyi kısıtlayan bir beslenme yöntemidir. Metabolizmayı düzenlemeye ve kilo kontrolüne yardımcı olur",image:"diyet3",color: .green),
        Dıyet(name: "Vegan Diyeti", describe: "Vegan diyet tüm hayvansal ürünleri dışlayan bitkisel temelli bir beslenme şeklidir. Çevreci ve etik beslenme yaklaşımını destekler", image: "diyet4",color: .pink),
        Dıyet(name: "Vejetaryen Diyeti", describe: "Vejetaryen diyet et tüketmeden, bitkisel ağırlıklı beslenmeyi temel alır. Süt ve yumurta gibi bazı hayvansal ürünler tercih edilebilir.", image: "diyet5",color: .mint),
        Dıyet(name: "Paleo Diyeti", describe: "Paleo diyeti işlenmemiş et, sebze, meyve ve kuruyemişlere odaklanır. Modern işlenmiş gıdalardan uzak durmayı hedefler.", image: "diyet6",color: .purple),
        Dıyet(name: "Glutensiz Diyet", describe: "Glutensiz diyet, gluten içeren buğday, arpa ve çavdarı tamamen dışlar. Çölyak veya gluten hassasiyeti olan kişilere uygundur.", image: "diyet7",color: .brown),
        Dıyet(name: "Düşük Karbonhidrat Diyeti", describe: "Düşük karbonhidrat diyeti ekmek, şeker ve nişastalı gıdaları azaltır. Kan şekerini dengeler ve kilo kaybına destek olur.", image: "diyet8",color: .teal),
        Dıyet(name: "DASH Diyeti", describe: "DASH diyeti, tansiyonu düşürmeye yönelik sebze, meyve ve düşük yağlı ürünlere dayalı bir beslenme planıdır. Sodyum tüketimini sınırlar.", image: "diyet9",color: .red),
        Dıyet(name: "MIND Diyeti", describe: "MIND diyeti, beyin sağlığını korumayı hedefleyen Akdeniz ve DASH diyetlerinin birleşimidir. Hafıza ve bilişsel işlevleri destekler.", image: "diyet10",color: .indigo)
    ]
    let columns = [
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(diet){diets in
                        NavigationLink(destination: Text("\(diets.name) sayfası yakında 🍽️")) {
                                    HStack(spacing: 10) {
                                        Spacer()
                                        VStack{
                                            Text(diets.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                                .bold()
                                                .padding(2)
                                            Text(diets.describe)
                                                .font(.system(size: 13))
                                                .foregroundColor(.white)
                                                
                                        }
                                        //Spacer()
                                    Image(diets.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        //foregroundColor(.black)
                                        .padding()
                                        //.background(Color.gray.opacity(0.8))
                                        .clipShape(Circle())
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 130)
                                    .background(diets.color.opacity(0.7))
                                    .cornerRadius(40)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 3)
                                }
                                    }
                                        }
                                        .padding()
                                }
                            .navigationTitle("DİYETLER")
        }
    }
}
#Preview {
    Diyet()
}
