//
//  Diyet.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 27.11.2025.
//

import SwiftUI

struct Diyet: View {

    let diet: [Dıyet] = [
        Dıyet(
            name: "Ketojenik Diyet",
            describe: "Ketojenik diyet, karbonhidratı çok düşük tutup yağ tüketimini artırarak vücudun yağ yakımını hızlandırmayı amaçlar.",
            image: "diyet1",
            color: .orange,
            type: .keto
        ),
        Dıyet(
            name: "Akdeniz Diyeti",
            describe: "Akdeniz diyeti, sebze, meyve, tam tahıl ve sağlıklı yağlara dayalı kalp dostu bir beslenme modelidir.",
            image: "diyet2",
            color: .blue,
            type: .akdeniz
        ),
        Dıyet(
            name: "Aralıklı Oruç Diyeti",
            describe: "Aralıklı oruç, günün belirli saatlerinde yemek yemeyi kısıtlayan bir beslenme yöntemidir.",
            image: "diyet3",
            color: .green,
            type: .aralikliOruc
        ),
        Dıyet(
            name: "Vegan Diyeti",
            describe: "Vegan diyet tüm hayvansal ürünleri dışlayan bitkisel temelli bir beslenme şeklidir.",
            image: "diyet4",
            color: .pink,
            type: .vegan
        ),
        Dıyet(
            name: "Vejetaryen Diyeti",
            describe: "Vejetaryen diyet et tüketmeden, bitkisel ağırlıklı beslenmeyi temel alır.",
            image: "diyet5",
            color: .mint,
            type: .vejetaryen
        ),
        Dıyet(
            name: "Paleo Diyeti",
            describe: "Paleo diyeti işlenmemiş et, sebze, meyve ve kuruyemişlere odaklanır.",
            image: "diyet6",
            color: .purple,
            type: .paleo
        ),
        Dıyet(
            name: "Glutensiz Diyet",
            describe: "Glutensiz diyet, gluten içeren tahılları tamamen dışlar.",
            image: "diyet7",
            color: .brown,
            type: .glutensiz
        ),
        Dıyet(
            name: "Düşük Karbonhidrat Diyeti",
            describe: "Düşük karbonhidrat diyeti ekmek ve şekeri azaltarak kilo kontrolüne yardımcı olur.",
            image: "diyet8",
            color: .teal,
            type: .dusukKarbonhidrat
        ),
        Dıyet(
            name: "DASH Diyeti",
            describe: "DASH diyeti, tansiyonu düşürmeye yönelik bir beslenme planıdır.",
            image: "diyet9",
            color: .red,
            type: .dash
        ),
        Dıyet(
            name: "MIND Diyeti",
            describe: "MIND diyeti, beyin sağlığını korumayı hedefler.",
            image: "diyet10",
            color: .indigo,
            type: .mind
        )
    ]

    let columns = [
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(diet) { diets in
                        NavigationLink(
                            destination: destinationView(for: diets.type)
                        ) {
                            HStack(spacing: 10) {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(diets.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .bold()

                                    Text(diets.describe)
                                        .font(.system(size: 13))
                                        .foregroundColor(.white)
                                        .lineLimit(3)
                                }

                                Spacer()

                                Image(diets.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            }
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 130)
                            .background(diets.color.opacity(0.75))
                            .cornerRadius(30)
                            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 3)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("DİYETLER")
        }
    }

    // 🔴 ASIL OLAY BURASI
    @ViewBuilder
    private func destinationView(for type: DietType) -> some View {
        switch type {
        case .keto:
            KetojenikDiyetView()
        case .akdeniz:
            AkdenizDiyetView()
        case .aralikliOruc:
            AralikliOrucView()
        case .vegan:
            VeganDiyetView()
        case .vejetaryen:
            VejetaryenDiyetView()
        case .paleo:
            PaleoDiyetView()
        case .glutensiz:
            GlutensizDiyetView()
        case .dusukKarbonhidrat:
            DusukKarbonhidratView()
        case .dash:
            DASHDiyetView()
        case .mind:
            MINDDiyetView()
        }
    }
}

#Preview {
    Diyet()
}
