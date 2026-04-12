import Foundation
import SwiftUI
import PhotosUI

struct sıngınUser: View {
    @EnvironmentObject private var authViewModel: AuthViewModel

    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?

    private var kullanıcıAdı: String {
        authViewModel.displayName.isEmpty ? "Kullanıcı" : authViewModel.displayName
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(.systemBackground),
                    Color.green.opacity(0.06),
                    Color.orange.opacity(0.04)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    üstAlan
                    hızlıİşlemler
                    favoriDiyetler
                    analizKartı
                    sağlıkÖzeti
                    çıkışButonu
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

// MARK: - UI Bölümleri
private extension sıngınUser {

    var üstAlan: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Hoş Geldin")
                        .font(.title3)
                        .foregroundColor(.secondary)

                    Text(kullanıcıAdı)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    Text("Bugün sağlıklı seçimler için harika bir gün.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                PhotosPicker(
                    selection: $selectedPhotoItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    ZStack(alignment: .bottomTrailing) {
                        Group {
                            if let selectedPhotoData,
                               let uiImage = UIImage(data: selectedPhotoData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                ZStack {
                                    Circle()
                                        .fill(Color.green.opacity(0.15))

                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(14)
                                        .foregroundColor(.green)
                                }
                            }
                        }
                        .frame(width: 78, height: 78)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                        )
                        .shadow(color: .black.opacity(0.10), radius: 8, x: 0, y: 4)

                        ZStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 24, height: 24)

                            Image(systemName: "camera.fill")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }
                }
                .onChange(of: selectedPhotoItem) { _, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            await MainActor.run {
                                selectedPhotoData = data
                            }
                        }
                    }
                }
            }

            Text("Profil fotoğrafını değiştirmek için resme dokun.")
                .font(.caption)
                .foregroundColor(.secondary)

            HStack(spacing: 12) {
                miniBilgiKartı(
                    ikon: "heart.text.square.fill",
                    başlık: "Sağlık",
                    altBaşlık: "Takibini sürdür"
                )

                miniBilgiKartı(
                    ikon: "flame.fill",
                    başlık: "Hedef",
                    altBaşlık: "Kalorini izle"
                )
            }
        }
    }

    var hızlıİşlemler: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Hızlı Erişim")
                .font(.title3)
                .fontWeight(.bold)

            HStack(spacing: 14) {
                dashboardButonu(
                    başlık: "Analizlerime Git",
                    altBaşlık: "Geçmiş analizlerini görüntüle",
                    ikon: "chart.bar.xaxis",
                    renk: .green
                ) {
                    print("Analizlerime Git tapped")
                }

                dashboardButonu(
                    başlık: "Öğün Ekle",
                    altBaşlık: "Yeni yemek analizi başlat",
                    ikon: "camera.viewfinder",
                    renk: .orange
                ) {
                    print("Öğün Ekle tapped")
                }
            }
        }
    }

    var favoriDiyetler: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Favori Diyetler")
                    .font(.title3)
                    .fontWeight(.bold)

                Spacer()

                Button("Tümünü Gör") {
                    print("Tüm favori diyetler")
                }
                .font(.subheadline)
                .foregroundColor(.green)
            }

            VStack(spacing: 12) {
                diyetSatırı(
                    renk: .green,
                    ikon: "leaf.fill",
                    başlık: "Akdeniz Diyeti",
                    açıklama: "Dengeli ve sürdürülebilir beslenme planı"
                )

                diyetSatırı(
                    renk: .orange,
                    ikon: "bolt.heart.fill",
                    başlık: "Ketojenik Diyet",
                    açıklama: "Düşük karbonhidrat odaklı beslenme"
                )

                diyetSatırı(
                    renk: .blue,
                    ikon: "clock.fill",
                    başlık: "Aralıklı Oruç",
                    açıklama: "Belirli saatlerde kontrollü beslenme"
                )
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)
            )
        }
    }

    var analizKartı: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Analiz Alanı")
                .font(.title3)
                .fontWeight(.bold)

            VStack(alignment: .leading, spacing: 14) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Son Analizlerin")
                            .font(.headline)
                            .fontWeight(.semibold)

                        Text("Yaptığın yemek analizlerini incele, sonuçlarını karşılaştır ve gelişimini takip et.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    Image(systemName: "waveform.path.ecg.rectangle.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.green)
                }

                Button {
                    print("Analiz detayına git")
                } label: {
                    HStack {
                        Text("Analizlerime Git")
                            .fontWeight(.semibold)

                        Spacer()

                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding(18)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)
            )
        }
    }

    var sağlıkÖzeti: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Senin İçin")
                .font(.title3)
                .fontWeight(.bold)

            VStack(spacing: 12) {
                öneriKartı(
                    ikon: "drop.fill",
                    başlık: "Su Takibi",
                    açıklama: "Günlük su tüketimini takip etmeyi unutma.",
                    renk: .blue
                )

                öneriKartı(
                    ikon: "figure.walk",
                    başlık: "Günlük Aktivite",
                    açıklama: "Beslenme kadar hareket de önemli. Küçük yürüyüşler ekle.",
                    renk: .purple
                )

                öneriKartı(
                    ikon: "fork.knife",
                    başlık: "Beslenme Önerileri",
                    açıklama: "Hedeflerine uygun yemek tercihlerini buradan inceleyebilirsin.",
                    renk: .orange
                )
            }
        }
    }

    var çıkışButonu: some View {
        Button {
            Task {
                await authViewModel.logout()
            }
        } label: {
            HStack(spacing: 10) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                Text("Çıkış Yap")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: .red.opacity(0.22), radius: 10, x: 0, y: 6)
        }
        .padding(.top, 8)
    }
}

// MARK: - Küçük Bileşenler
private extension sıngınUser {

    func miniBilgiKartı(ikon: String, başlık: String, altBaşlık: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.12))
                    .frame(width: 42, height: 42)

                Image(systemName: ikon)
                    .foregroundColor(.green)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(başlık)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(altBaşlık)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }

    func dashboardButonu(
        başlık: String,
        altBaşlık: String,
        ikon: String,
        renk: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(renk.opacity(0.15))
                        .frame(width: 48, height: 48)

                    Image(systemName: ikon)
                        .foregroundColor(renk)
                        .font(.title3)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(başlık)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text(altBaşlık)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }

                Spacer()
            }
            .padding(16)
            .frame(maxWidth: .infinity, minHeight: 150, alignment: .topLeading)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)
            )
        }
        .buttonStyle(.plain)
    }

    func diyetSatırı(
        renk: Color,
        ikon: String,
        başlık: String,
        açıklama: String
    ) -> some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(renk.opacity(0.14))
                    .frame(width: 50, height: 50)

                Image(systemName: ikon)
                    .foregroundColor(renk)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(başlık)
                    .font(.headline)

                Text(açıklama)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray.opacity(0.7))
        }
        .padding(.vertical, 4)
    }

    func öneriKartı(
        ikon: String,
        başlık: String,
        açıklama: String,
        renk: Color
    ) -> some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(renk.opacity(0.14))
                    .frame(width: 52, height: 52)

                Image(systemName: ikon)
                    .foregroundColor(renk)
                    .font(.headline)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(başlık)
                    .font(.headline)

                Text(açıklama)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
    }
}

#Preview {
    sıngınUser()
        .environmentObject(AuthViewModel())
}
