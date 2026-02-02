import SwiftUI

struct KetojenikDiyetView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image("diyet1")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 390, height: 390)

                Text("Ketojenik Diyet")
                    .font(.largeTitle)
                    .bold()

                Text("""
Ketojenik diyet, karbonhidratı çok düşük tutup yağ tüketimini artırarak vücudu ketozis durumuna sokmayı amaçlayan bir beslenme şeklidir. Bu diyette vücut enerji kaynağı olarak glikoz yerine yağları kullanır.

Karbonhidrat alımının ciddi şekilde sınırlandırılmasıyla birlikte insülin seviyesi düşer ve yağ yakımı hızlanır. Bu durum kilo kaybı ve metabolik denge açısından önemli faydalar sağlar.
""")
                .font(.body)
                .lineSpacing(8)

                Divider()

                Text("Neler Tüketilir?")
                    .font(.headline)

                Text("""
• Et, tavuk, balık
• Yumurta
• Avokado
• Zeytinyağı, tereyağı
• Yeşil yapraklı sebzeler
""")

                Divider()

                Text("Kimler İçin Uygun Değildir?")
                    .font(.headline)

                Text("""
Hamileler, böbrek hastaları ve kronik rahatsızlığı olan bireyler bu diyeti uygulamadan önce mutlaka uzman görüşü almalıdır.
""")
            }
            .padding()
        }
        .navigationTitle("Ketojenik Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}
