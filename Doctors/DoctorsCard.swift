import SwiftUI

struct DoctorsCard: View {
    
    let doctors: [Doctor] = [
        Doctor(
            name: "Dr. Bahar Atbaş",
            title: "Diyetisyen",
            price: 750,
            description: "Online ve yüz yüze danışmanlık hizmeti vermektedir.",
            image: "profile1"
        ),
        Doctor(
            name: "Dr. Baran Can Atbaş",
            title: "Uzman Diyetisyen",
            price: 900,
            description: "Sporcu beslenmesi alanında uzmanlaşmıştır.",
            image: "profile4"
        ),
        Doctor(
            name: "Dr. Lara Çetrez",
            title: "Diyetisyen",
            price: 800,
            description: "Kilo kontrolü ve metabolizma üzerine çalışmaktadır.",
            image: "profile3"
        ),
        Doctor(
            name: "Dr. Umay Gençer",
            title: "Intern Diyetisyen",
            price: 550,
            description: "Sporcu beslenmesi alanında uzmanlaşmıştır.",
            image: "profile5"
        ),
        Doctor(
            name: "Dr. Seda Yılmaz",
            title: "Diyetisyen",
            price: 950,
            description: "Kilo kontrolü ve metabolizma üzerine çalışmaktadır.",
            image: "profile6"
        ),
        Doctor(
            name: "Dr. Ülkü Arslan",
            title: "Diyetisyen",
            price: 950,
            description: "Kilo kontrolü ve metabolizma üzerine çalışmaktadır.",
            image: "profile7"
        ),
        Doctor(
            name: "Dr. Kenan Yıldız",
            title: "Diyetisyen",
            price: 950,
            description: "Kilo kontrolü ve metabolizma üzerine çalışmaktadır.",
            image: "profile8"
        ),
        Doctor(
            name: "Dr. Fatmanur Gücek",
            title: "Diyetisyen",
            price: 950,
            description: "Kilo kontrolü ve metabolizma üzerine çalışmaktadır.",
            image: "profile9"
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(.systemBackground),
                        Color.green.opacity(0.06),
                        Color(.systemGroupedBackground),
                        Color.white
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    topHeader
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            statsSection
                            
                            LazyVStack(spacing: 18) {
                                ForEach(doctors) { doctor in
                                    DoctorCardView(doctor: doctor)
                                }
                            }
                            .padding(.bottom, 30)
                        }
                        .padding(.top, 20)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Diyetisyenler")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.primary)
                }
            }
        }
    }
    
    private var topHeader: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [
                    Color.green.opacity(0.95),
                    Color.green.opacity(0.75),
                    Color.teal.opacity(0.65)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: 250)
            .clipShape(
                RoundedRectangle(cornerRadius: 32, style: .continuous)
            )
            .overlay(
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.10))
                        .frame(width: 170, height: 170)
                        .offset(x: 120, y: -40)
                    
                    Circle()
                        .fill(Color.white.opacity(0.08))
                        .frame(width: 120, height: 120)
                        .offset(x: 150, y: 45)
                }
            )
            .padding(.horizontal, 16)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 10) {
                    Image(systemName: "cross.case.fill")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.green)
                        .frame(width: 40, height: 40)
                        .background(Color.white)
                        .clipShape(Circle())
                    
                    Text("Uzman Diyetisyenler")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.white)
                }
                
                Text("Sağlıklı beslenme yolculuğunda sana eşlik edecek uzmanları inceleyebilir, detaylarına göz atabilir ve seans planlayabilirsin.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white.opacity(0.92))
                    .lineSpacing(3)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 10) {
                    Label("\(doctors.count)+ Uzman", systemImage: "person.2.fill")
                    Label("Online Destek", systemImage: "video.fill")
                }
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.top, 4)
            }
            .padding(.horizontal, 34)
            .padding(.bottom, 28)
        }
    }
    
    private var statsSection: some View {
        HStack(spacing: 14) {
            statItem(
                title: "Toplam Uzman",
                value: "\(doctors.count)",
                icon: "stethoscope"
            )
            
            statItem(
                title: "Başlangıç Fiyatı",
                value: "550 TL",
                icon: "creditcard.fill"
            )
        }
        .padding(.horizontal, 16)
    }
    
    private func statItem(title: String, value: String, icon: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.green.opacity(0.12))
                    .frame(width: 46, height: 46)
                
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.green)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(value)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.primary)
                
                Text(title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(.white.opacity(0.95))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color.black.opacity(0.05), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.05), radius: 12, x: 0, y: 6)
    }
}

struct DoctorCardView: View {
    
    let doctor: Doctor
    
    var body: some View {
        HStack(alignment: .center, spacing: 14) {
            
            ZStack {
                LinearGradient(
                    colors: [
                        Color.green.opacity(0.22),
                        Color.white,
                        Color.green.opacity(0.08)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(width: 82, height: 82)
                .clipShape(Circle())
                
                Circle()
                    .stroke(Color.white.opacity(0.9), lineWidth: 3)
                    .frame(width: 74, height: 74)
                
                Image(doctor.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 68, height: 68)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Text(doctor.title)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundStyle(.green)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.green.opacity(0.12))
                        .clipShape(Capsule())
                    
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.green)
                }
                
                Text(doctor.name)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                
                Text(doctor.description)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
                HStack(spacing: 6) {
                    Image(systemName: "tag.fill")
                        .font(.system(size: 11))
                        .foregroundStyle(.green)
                    
                    Text("Fiyat: \(doctor.price) TL")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.primary)
                }
            }
            
            Spacer(minLength: 8)
            
            NavigationLink(destination: DoctorPreview(doctor: doctor)) {
                VStack(spacing: 6) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 22))
                    Text("İncele")
                        .font(.system(size: 12, weight: .semibold))
                }
                .foregroundStyle(.white)
                .frame(width: 62, height: 62)
                .background(
                    LinearGradient(
                        colors: [Color.green, Color.teal],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .shadow(color: .green.opacity(0.25), radius: 10, x: 0, y: 6)
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.white,
                            Color.white,
                            Color.green.opacity(0.03)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Color.black.opacity(0.05), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06), radius: 14, x: 0, y: 8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    DoctorsCard()
}
