//
//  AralikliOrucView.swift
//  AkıllıTabak
//

import SwiftUI

struct AralikliOrucView: View {

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 24) {

                Image("diyet3")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .cornerRadius(30)
                    .shadow(
                        color: .black.opacity(0.15),
                        radius: 10,
                        x: 0,
                        y: 6
                    )

                VStack(alignment: .leading, spacing: 20) {

                    VStack(alignment: .leading, spacing: 8) {

                        Text("Aralıklı Oruç")
                            .font(.system(size: 34, weight: .bold))

                        HStack(spacing: 10) {

                            Label(
                                "16:8 Metodu",
                                systemImage: "clock.fill"
                            )

                            Label(
                                "Kilo Kontrolü",
                                systemImage: "scalemass.fill"
                            )
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }

                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
Aralıklı oruç, günün belirli saatlerinde yemek yemeyi, kalan saatlerde ise kalori alımını durdurmayı esas alır. En yaygın yöntemler 16:8 ve 18:6 sistemleridir.

Bu yöntem insülin hassasiyetini artırabilir ve kilo kontrolüne yardımcı olabilir.
"""
                    )

                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Protein ağırlıklı öğünler
• Sebzeler
• Sağlıklı yağlar
• Bol su
"""
                    )

                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Hamileler, yeme bozukluğu geçmişi olanlar ve diyabet hastaları için uygun değildir.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Aralıklı Oruç")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AralikliOrucView()
    }
}
