import SwiftUI
import UIKit

struct meatAI: View {
    @State private var pickerAcik = false
    @State private var secilenGorsel: UIImage?
    @State private var secilenKaynak: UIImagePickerController.SourceType = .camera
    
    @State private var kaynakSecimSayfasi = false
    @State private var kameraYokUyarisi = false
    @State private var galeriYokUyarisi = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color.black,
                        Color.green.opacity(0.85),
                        Color.white.opacity(0.88)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        ustKart
                        ozellikKartlari
                        kameraKart
                        gorselAlanKart
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 24)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $pickerAcik) {
                ImagePickerView(
                    secilenGorsel: $secilenGorsel,
                    kaynakTipi: secilenKaynak
                )
                .ignoresSafeArea()
            }
            .confirmationDialog(
                "Görsel Kaynağı Seç",
                isPresented: $kaynakSecimSayfasi,
                titleVisibility: .visible
            ) {
                Button("Kamera") {
                    kameraAc()
                }
                
                Button("Galeriden Seç") {
                    galeriAc()
                }
                
                Button("İptal", role: .cancel) { }
            }
            .alert("Kamera kullanılamıyor", isPresented: $kameraYokUyarisi) {
                Button("Tamam", role: .cancel) { }
            } message: {
                Text("Bu cihazda kamera bulunamadı. Gerçek bir iPhone ile test et.")
            }
            .alert("Galeri açılamıyor", isPresented: $galeriYokUyarisi) {
                Button("Tamam", role: .cancel) { }
            } message: {
                Text("Fotoğraf galerisine erişilemiyor.")
            }
        }
    }

    private var ustKart: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("MeatAI")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)

                    Text("Yemeğini kamerayla tara veya galeriden fotoğraf seç, ardından akıllı analiz sürecini başlat.")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.35))
                        .frame(width: 64, height: 64)

                    Image(systemName: "camera.viewfinder")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.white)
                }
            }

            Button {
                kaynakSecimSayfasi = true
            } label: {
                HStack {
                    Image(systemName: "photo.on.rectangle.angled")
                    Text("Fotoğraf Ekle")
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .foregroundStyle(.black)
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            }

            Text("İpucu: İstersen kamerayla anlık çek, istersen galeriden mevcut yemeği seç.")
                .font(.footnote)
                .foregroundStyle(.white.opacity(0.75))
        }
        .padding(22)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Color.gray.opacity(0.35), lineWidth: 1)
        )
    }

    private var ozellikKartlari: some View {
        HStack(spacing: 14) {
            bilgiKutusu(
                icon: "camera.fill",
                baslik: "Anlık Çekim",
                aciklama: "Kamerayla hemen fotoğraf al"
            )

            bilgiKutusu(
                icon: "photo.fill",
                baslik: "Galeri Seçimi",
                aciklama: "Mevcut fotoğrafı yükle"
            )
        }
    }

    private var kameraKart: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Nasıl çalışır?")
                .font(.title3.bold())
                .foregroundStyle(.white)

            VStack(spacing: 12) {
                adimSatiri(sira: "1", metin: "Kamera veya galeri seç")
                adimSatiri(sira: "2", metin: "Yemeğin görselini ekle")
                adimSatiri(sira: "3", metin: "Analize gönder ve sonucu bekle")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.gray.opacity(0.35))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var gorselAlanKart: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Görsel Önizleme")
                .font(.title3.bold())
                .foregroundStyle(.white)

            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color.white.opacity(0.10))
                    .frame(height: 260)

                if let secilenGorsel {
                    Image(uiImage: secilenGorsel)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 260)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                } else {
                    VStack(spacing: 12) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: 42))
                            .foregroundStyle(.white.opacity(0.85))

                        Text("Henüz görsel seçilmedi")
                            .font(.headline)
                            .foregroundStyle(.white)

                        Text("Kameradan çek veya galeriden bir fotoğraf seç")
                            .font(.footnote)
                            .foregroundStyle(.white.opacity(0.75))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            }

            HStack(spacing: 12) {
                Button {
                    kaynakSecimSayfasi = true
                } label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text(secilenGorsel == nil ? "Görsel Seç" : "Görseli Değiştir")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }

                Button {
                    analizeGonder()
                } label: {
                    HStack {
                        Image(systemName: "sparkles")
                        Text("Analize Gönder")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(secilenGorsel == nil ? Color.gray.opacity(0.5) : Color.green)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
                .disabled(secilenGorsel == nil)
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.18))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private func bilgiKutusu(icon: String, baslik: String, aciklama: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white)

            Text(baslik)
                .font(.headline)
                .foregroundStyle(.white)

            Text(aciklama)
                .font(.footnote)
                .foregroundStyle(.white.opacity(0.78))
        }
        .frame(maxWidth: .infinity, minHeight: 140, alignment: .topLeading)
        .padding(18)
        .background(Color.white.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }

    private func adimSatiri(sira: String, metin: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 28, height: 28)

                Text(sira)
                    .font(.footnote.bold())
                    .foregroundStyle(.black)
            }

            Text(metin)
                .foregroundStyle(.white.opacity(0.9))

            Spacer()
        }
    }

    private func kameraAc() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            kameraYokUyarisi = true
            return
        }
        secilenKaynak = .camera
        pickerAcik = true
    }

    private func galeriAc() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            galeriYokUyarisi = true
            return
        }
        secilenKaynak = .photoLibrary
        pickerAcik = true
    }

    private func analizeGonder() {
        print("Analize gönderildi")
    }
}

#Preview {
    meatAI()
}
