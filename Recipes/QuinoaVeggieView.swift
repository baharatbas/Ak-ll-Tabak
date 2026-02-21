//
//  QuinoaVeggieView.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 21.02.2026.
//

import SwiftUI

struct QuinoaVeggieView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("quinoabowl")
                    .resizable()
                    .frame(width: 420, height: 300)
                    .cornerRadius(24)


                Text("Quinoa Veggie Bowl")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                Text("""
Quinoa Veggie Bowl, bitkisel protein açısından zengin ve dengeli bir öğündür. Lif oranı yüksektir ve sindirimi destekler.

Vegan ve vejetaryen beslenenler için sağlıklı bir alternatif sunar.
""")
                .lineSpacing(8)
                .padding()

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)
                    .padding()

                Text("""
• Haşlanmış quinoa
• Izgara kabak ve biber
• Nohut
• Zeytinyağı ve limon
• Maydanoz
""")
                .padding()

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)
                    .padding()

                Text("""
Tahıl hassasiyeti olan bireyler dikkatli tüketmelidir.
""")
                .padding()
            }
            
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    QuinoaVeggieView()
}
