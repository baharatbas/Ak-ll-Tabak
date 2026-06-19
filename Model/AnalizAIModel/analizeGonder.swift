import SwiftUI
import UIKit
import CoreML
import SwiftData

struct analizeGonder: View {
    let gorsel: UIImage?
    @Environment(\.modelContext) private var modelContext
    
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
    @State private var aiYorumu: String = ""
    @State private var yorumYukleniyor = false
    @State private var hataMesaji = ""
    
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
                    } else if !hataMesaji.isEmpty {
                        Text("Hata: \(hataMesaji)")
                            .font(.subheadline.bold())
                            .foregroundStyle(.red)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
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
                            Image(systemName: "photo.on.rectangle")
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
            Text("AI Yorumu")
                .font(.footnote.bold())
                .foregroundStyle(.black.opacity(0.6))
                .textCase(.uppercase)
                .tracking(1.2)

            if yorumYukleniyor {
                HStack {
                    ProgressView()
                    Text("AI yorum hazırlanıyor...")
                        .font(.subheadline)
                }
                .padding(14)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            } else {
                Text(aiYorumu.isEmpty ? "Yorum hazırlanamadı." : aiYorumu)
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.82))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
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
        guard let uiImage = gorsel else {
            hataMesaji = "Görsel bulunamadı."
            return
        }

        yukleniyor = true
        sonuc = nil
        hataMesaji = ""
        aiYorumu = ""

        Task {
            do {
                print("✅ Analiz başladı")

                let result = try await MealAnalysisService().analyze(image: uiImage)

                print("✅ API sonucu geldi:", result)

                await MainActor.run {
                    let yeniSonuc = AnalizSonucu(
                        yemekAdi: result.foodName,
                        kalori: result.calories,
                        protein: result.protein,
                        karbonhidrat: result.carbs,
                        yag: result.fat,
                        puan: min(100, max(20, 100 - result.calories / 15))
                    )

                    sonuc = yeniSonuc
                    aiYorumu = result.comment

                    let record = MealAnalysisRecord(
                        foodName: result.foodName,
                        calories: result.calories,
                        protein: result.protein,
                        carbs: result.carbs,
                        fat: result.fat,
                        comment: result.comment
                    )

                    modelContext.insert(record)

                    do {
                        try modelContext.save()
                    } catch {
                        print("Kayıt hatası:", error.localizedDescription)
                    }

                    yukleniyor = false
                }
            } catch {
                print("❌ ANALİZ HATASI:", error.localizedDescription)

                await MainActor.run {
                    hataMesaji = error.localizedDescription
                    yukleniyor = false
                }
            }
        }
    }
    
    private func aiYorumuOlustur(sonuc: AnalizSonucu) {
        yorumYukleniyor = true
        aiYorumu = ""

        Task {
            do {
                let prompt = """
                Kullanıcının tabağında şu yemek tespit edildi: \(sonuc.yemekAdi)

                Tahmini besin değerleri:
                Kalori: \(sonuc.kalori) kcal
                Protein: \(Int(sonuc.protein)) g
                Karbonhidrat: \(Int(sonuc.karbonhidrat)) g
                Yağ: \(Int(sonuc.yag)) g
                Sağlık skoru: \(sonuc.puan)/100

                Bu yemeği kullanıcıya Türkçe, kısa, profesyonel ve sağlıklı beslenme odaklı yorumla.
                3-4 cümle yeterli olsun.
                Kesin tıbbi tavsiye verme, sadece genel beslenme önerisi ver.
                """

                let yorum = try await GeminiService().sendMessage(prompt)

                await MainActor.run {
                    self.aiYorumu = yorum
                    self.yorumYukleniyor = false
                }
            } catch {
                await MainActor.run {
                    self.aiYorumu = "AI yorumu alınamadı. Besin değerleri tahmini olarak gösteriliyor."
                    self.yorumYukleniyor = false
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
