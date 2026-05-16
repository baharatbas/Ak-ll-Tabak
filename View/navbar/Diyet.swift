import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

struct Diyet: View {
    
    var limit: Int? = nil
    
    let diet: [Dıyet] = [
        Dıyet(name: "Ketojenik Diyet",
              describe: "Karbonhidratı azaltıp yağ tüketimini artıran beslenme modeli.",
              image: "diyet1",
              color: Color(hex: "#FF6B00"),
              type: .keto),
        
        Dıyet(name: "Akdeniz Diyeti",
              describe: "Sebze, meyve ve sağlıklı yağ odaklı kalp dostu diyet.",
              image: "diyet2",
              color: Color(hex: "#1565C0"),
              type: .akdeniz),
        
        Dıyet(name: "Aralıklı Oruç",
              describe: "Belirli saatlerde yemek yemeyi temel alan sistem.",
              image: "diyet3",
              color: Color(hex: "#2E7D32"),
              type: .aralikliOruc),
        
        Dıyet(name: "Vegan Diyeti",
              describe: "Hayvansal ürünleri tamamen dışlayan beslenme modeli.",
              image: "diyet4",
              color: Color(hex: "#C2185B"),
              type: .vegan),
        
        Dıyet(name: "Vejetaryen Diyeti",
              describe: "Et tüketmeden bitkisel ağırlıklı beslenme yaklaşımı.",
              image: "diyet5",
              color: Color(hex: "#00897B"),
              type: .vejetaryen),
        
        Dıyet(name: "Paleo Diyeti",
              describe: "İşlenmemiş doğal besinleri temel alan diyet.",
              image: "diyet6",
              color: Color(hex: "#6A1B9A"),
              type: .paleo),
        
        Dıyet(name: "Glutensiz Diyet",
              describe: "Gluten içeren tahılları dışlayan beslenme sistemi.",
              image: "diyet7",
              color: Color(hex: "#4E342E"),
              type: .glutensiz),
        
        Dıyet(name: "Düşük Karbonhidrat",
              describe: "Şeker ve karbonhidratı azaltmaya odaklı diyet.",
              image: "diyet8",
              color: Color(hex: "#00838F"),
              type: .dusukKarbonhidrat),
        
        Dıyet(name: "DASH Diyeti",
              describe: "Tansiyonu dengelemeyi hedefleyen beslenme planı.",
              image: "diyet9",
              color: Color(hex: "#C62828"),
              type: .dash),
        
        Dıyet(name: "MIND Diyeti",
              describe: "Beyin sağlığını destekleyen beslenme modeli.",
              image: "diyet10",
              color: Color(hex: "#283593"),
              type: .mind)
    ]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: - Header
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Popular Diets")
                        .font(.system(size: 34, weight: .bold))
                    
                    Text("Healthy nutrition plans specially prepared for your lifestyle.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                
                // MARK: - Diet Cards
                
                LazyVStack(spacing: 20) {
                    
                    ForEach(displayedDiet) { diets in
                        
                        NavigationLink(destination: destinationView(for: diets.type)) {
                            
                            ZStack {
                                
                                diets.color
                                
                                HStack(spacing: 18) {
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Text(diets.name)
                                            .font(.title3.bold())
                                            .foregroundColor(.white)
                                        
                                        Text(diets.describe)
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.9))
                                            .lineLimit(3)
                                        
                                        HStack(spacing: 6) {
                                            
                                            Image(systemName: "leaf.fill")
                                            
                                            Text("Healthy Choice")
                                        }
                                        .font(.caption.weight(.semibold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(.white.opacity(0.25))
                                        .clipShape(Capsule())
                                    }
                                    
                                    Spacer()
                                    
                                    // MARK: - Image
                                    
                                    Image(diets.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 110, height: 110)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(.white.opacity(0.8),
                                                        lineWidth: 3)
                                        )
                                        .shadow(color: .black.opacity(0.15),
                                                radius: 8,
                                                x: 0,
                                                y: 5)
                                }
                                .padding(22)
                            }
                            .frame(height: 170)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(color: diets.color.opacity(0.4),
                                    radius: 10,
                                    x: 0,
                                    y: 6)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
    }
    
    
    // MARK: - Displayed Diet
    
    private var displayedDiet: [Dıyet] {
        if let limit {
            return Array(diet.prefix(limit))
        }
        return diet
    }
    
    
    // MARK: - Navigation
    
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
    NavigationStack {
        Diyet(limit: 10)
    }
}
