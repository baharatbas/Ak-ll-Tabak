import SwiftUI
import UIKit
import CoreML

struct analizeGonder: View {
    let gorsel: UIImage?
    
    struct AnalizSonucu {
        let yemekAdi: String
        let kalori: Int
        let protein: Double
        let karbonhidrat: Double
        let yag: Double
        let puan: Int
    }
    
    @State private var sonuc: AnalizSonucu?
    @State private var yukleniyor = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.black.opacity(0.30),
                    Color.green.opacity(0.85),
                    Color.white.opacity(0.88)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    gorselKart
                    
                    if yukleniyor {
                        yukleniyorKart
                    } else if let sonuc {
                        yemekBaslikKart(sonuc: sonuc)
                        makroKartlari(sonuc: sonuc)
                        saglikPuaniKart(sonuc: sonuc)
                        oneriKart
                    }
                    
                    yenileButon
                        .padding(.bottom, 32)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if sonuc == nil { basitAnaliz() }
        }
    }
    
    // MARK: - Görsel Kart
    private var gorselKart: some View {
        ZStack(alignment: .bottomLeading) {
            if let image = gorsel {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            } else {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .frame(height: 240)
                    .overlay {
                        VStack(spacing: 10) {
                            Image(systemName: "photo.slash")
                                .font(.system(size: 36))
                                .foregroundStyle(.white.opacity(0.4))
                            Text("Görsel bulunamadı")
                                .font(.subheadline)
                                .foregroundStyle(.black.opacity(0.5))
                        }
                    }
            }
            
            LinearGradient(
                colors: [.clear, .black.opacity(0.5)],
                startPoint: .center,
                endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            
            Label("AI Analizi", systemImage: "sparkles")
                .font(.caption.bold())
                .foregroundStyle(.black)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(.ultraThinMaterial)
                .clipShape(Capsule())
                .padding(16)
        }
    }
    
    // MARK: - Yükleniyor
    private var yukleniyorKart: some View {
        VStack(spacing: 16) {
            ProgressView()
                .tint(.white)
                .scaleEffect(1.3)
            Text("Görsel analiz ediliyor...")
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.75))
        }
        .frame(maxWidth: .infinity)
        .padding(32)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
    
    // MARK: - Yemek Başlık
    private func yemekBaslikKart(sonuc: AnalizSonucu) -> some View {
        HStack(alignment: .center, spacing: 14) {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.15))
                    .frame(width: 54, height: 54)
                Image(systemName: "fork.knife")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(.black)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(sonuc.yemekAdi)
                    .font(.title2.bold())
                    .foregroundStyle(.black)
                Text("Yapay zeka tarafından tanımlandı")
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.6))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text("\(sonuc.kalori)")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.black)
                Text("kcal")
                    .font(.caption.bold())
                    .foregroundStyle(.black.opacity(0.6))
            }
        }
        .padding(18)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
    }
    
    // MARK: - Makro Kartları
    private func makroKartlari(sonuc: AnalizSonucu) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Besin Değerleri")
                .font(.footnote.bold())
                .foregroundStyle(.black.opacity(0.6))
                .textCase(.uppercase)
                .tracking(1.2)
            
            HStack(spacing: 10) {
                makroKutu(deger: "\(Int(sonuc.protein))g", etiket: "Protein", icon: "bolt.fill")
                makroKutu(deger: "\(Int(sonuc.karbonhidrat))g", etiket: "Karbonhidrat", icon: "flame.fill")
                makroKutu(deger: "\(Int(sonuc.yag))g", etiket: "Yağ", icon: "drop.fill")
            }
        }
    }
    
    private func makroKutu(deger: String, etiket: String, icon: String) -> some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundStyle(.black.opacity(0.85))
            Text(deger)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.black)
            Text(etiket)
                .font(.caption2)
                .foregroundStyle(.black.opacity(0.6))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
    
    // MARK: - Sağlık Puanı
    private func saglikPuaniKart(sonuc: AnalizSonucu) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Sağlık Skoru")
                .font(.footnote.bold())
                .foregroundStyle(.black.opacity(0.6))
                .textCase(.uppercase)
                .tracking(1.2)
            
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.15), lineWidth: 6)
                        .frame(width: 72, height: 72)
                    Circle()
                        .trim(from: 0, to: CGFloat(sonuc.puan) / 100)
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: 72, height: 72)
                    Text("\(sonuc.puan)")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.black)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(puanMetni(sonuc.puan))
                        .font(.headline)
                        .foregroundStyle(.black)
                    Text("Bu yemek genel olarak \(puanAltMetni(sonuc.puan)) bir seçimdir.")
                        .font(.caption)
                        .foregroundStyle(.black.opacity(0.65))
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }
            .padding(16)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
        }
    }
    
    // MARK: - Öneri Kart
    private var oneriKart: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Öneriler")
                .font(.footnote.bold())
                .foregroundStyle(.black.opacity(0.6))
                .textCase(.uppercase)
                .tracking(1.2)
            
            VStack(spacing: 10) {
                oneriSatiri(icon: "checkmark.circle.fill",
                            metin: "Yüksek protein içeriği kas gelişimini destekler.")
                oneriSatiri(icon: "exclamationmark.circle.fill",
                            metin: "Karbonhidrat oranı orta düzeyde, porsiyon kontrolü önerilir.")
                oneriSatiri(icon: "info.circle.fill",
                            metin: "Yanında bol yeşillik tüketilmesi tavsiye edilir.")
            }
        }
    }
    
    private func oneriSatiri(icon: String, metin: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16))
                .foregroundStyle(.black.opacity(0.85))
                .padding(.top, 1)
            Text(metin)
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .padding(14)
        .background(Color.white.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.white.opacity(0.12), lineWidth: 1)
        )
    }
    
    // MARK: - Yenile Butonu
    private var yenileButon: some View {
        Button {
            basitAnaliz()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "arrow.clockwise")
                    .font(.system(size: 15, weight: .semibold))
                Text("Analizi Yenile")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.black)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .opacity(yukleniyor ? 0.4 : 1)
        }
        .disabled(yukleniyor)
    }
    
    // MARK: - Yardımcılar
    private func puanMetni(_ puan: Int) -> String {
        switch puan {
        case 80...100: return "Mükemmel Seçim 🌿"
        case 60...79:  return "İyi Seçim 👍"
        case 40...59:  return "Orta Düzey"
        default:       return "Dikkatli Tüket"
        }
    }
    
    private func puanAltMetni(_ puan: Int) -> String {
        switch puan {
        case 80...100: return "sağlıklı"
        case 60...79:  return "dengeli"
        case 40...59:  return "makul"
        default:       return "dikkat gerektiren"
        }
    }

    // MARK: - Analiz
    private func basitAnaliz() {
        guard let uiImage = gorsel else { return }

        yukleniyor = true
        sonuc = nil

        DispatchQueue.global(qos: .userInitiated).async {

            guard let resized = uiImage.resizeTo224(),
                  let cgImage = resized.cgImage else {
                DispatchQueue.main.async { yukleniyor = false }
                return
            }

            do {
                // MLMultiArray oluştur: [1, 224, 224, 3]
                let multiArray = try MLMultiArray(shape: [1, 224, 224, 3], dataType: .float32)

                let width = 224
                let height = 224
                let colorSpace = CGColorSpaceCreateDeviceRGB()
                var pixelData = [UInt8](repeating: 0, count: width * height * 4)

                guard let context = CGContext(
                    data: &pixelData,
                    width: width,
                    height: height,
                    bitsPerComponent: 8,
                    bytesPerRow: width * 4,
                    space: colorSpace,
                    bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
                ) else {
                    DispatchQueue.main.async { yukleniyor = false }
                    return
                }

                context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))

                for y in 0..<height {
                    for x in 0..<width {
                        let pixelIndex = (y * width + x) * 4
                        let r = Float(pixelData[pixelIndex])     / 255.0
                        let g = Float(pixelData[pixelIndex + 1]) / 255.0
                        let b = Float(pixelData[pixelIndex + 2]) / 255.0

                        multiArray[[0, y as NSNumber, x as NSNumber, 0]] = NSNumber(value: r)
                        multiArray[[0, y as NSNumber, x as NSNumber, 1]] = NSNumber(value: g)
                        multiArray[[0, y as NSNumber, x as NSNumber, 2]] = NSNumber(value: b)
                    }
                }

                let model = try FoodClassifier(configuration: MLModelConfiguration())
                let input = FoodClassifierInput(input_layer_1: multiArray)
                let prediction = try model.prediction(input: input)

                // ✅ featureValue ile output oku (classLabel üyesi yok)
                let yemekAdi = prediction.featureValue(for: "classLabel")?.stringValue ?? "Bilinmiyor"
                let probsDict = prediction.featureValue(for: "classLabelProbs")?.dictionaryValue as? [String: Double]
                let confidence = probsDict?[yemekAdi] ?? 0.75

                // Debug: output isimlerini konsola yaz
                print("Output feature names:", prediction.featureNames)

                DispatchQueue.main.async {
                    sonuc = AnalizSonucu(
                        yemekAdi: yemekAdi,
                        kalori: Int(confidence * 600),
                        protein: confidence * 50,
                        karbonhidrat: confidence * 30,
                        yag: confidence * 20,
                        puan: Int(confidence * 100)
                    )
                    yukleniyor = false
                }

            } catch {
                DispatchQueue.main.async {
                    print("HATA:", error)
                    yukleniyor = false
                }
            }
        }
    }
}

#Preview {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 200))
    let placeholder = renderer.image { ctx in
        UIColor.systemGreen.setFill()
        ctx.fill(CGRect(origin: .zero, size: CGSize(width: 300, height: 200)))
    }
    return NavigationStack {
        analizeGonder(gorsel: placeholder)
            .navigationTitle("Analiz")
    }
}
