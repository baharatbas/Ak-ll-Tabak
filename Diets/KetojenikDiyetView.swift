import SwiftUI

struct KetojenikDiyetView: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                Image("diyet1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 350)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.15),
                            radius: 10,
                            x: 0,
                            y: 6)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Ketojenik Diyet")
                            .font(.system(size: 34, weight: .bold))
                        
                        HStack(spacing: 10) {
                            
                            Label("Düşük Karbonhidrat",
                                  systemImage: "leaf.fill")
                            
                            Label("Yağ Yakımı",
                                  systemImage: "flame.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    InfoCard(
                        title: "Hakkında",
                        icon: "fork.knife",
                        content:
"""
Ketojenik diyet, karbonhidratı çok düşük tutup yağ tüketimini artırarak vücudu ketozis durumuna sokmayı amaçlayan bir beslenme şeklidir. Bu diyette vücut enerji kaynağı olarak glikoz yerine yağları kullanır.

Karbonhidrat alımının ciddi şekilde sınırlandırılmasıyla birlikte insülin seviyesi düşer ve yağ yakımı hızlanır. Bu durum kilo kaybı ve metabolik denge açısından önemli faydalar sağlar.
"""
                    )
                    
                    InfoCard(
                        title: "Neler Tüketilir?",
                        icon: "list.bullet",
                        content:
"""
• Et, tavuk, balık
• Yumurta
• Avokado
• Zeytinyağı, tereyağı
• Yeşil yapraklı sebzeler
"""
                    )
                    
                    InfoCard(
                        title: "Kimler İçin Uygun Değildir?",
                        icon: "exclamationmark.triangle.fill",
                        content:
"""
Hamileler, böbrek hastaları ve kronik rahatsızlığı olan bireyler bu diyeti uygulamadan önce mutlaka uzman görüşü almalıdır.
"""
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Ketojenik Diyet")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        KetojenikDiyetView()
    }
}
