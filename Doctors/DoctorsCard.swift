//
//  DoctorsCard.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 16.02.2026.
//

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
                        Color(.systemGroupedBackground),
                        Color.green.opacity(0.08),
                        Color.white
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Uzman Diyetisyenler")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(.primary)
                            
                            Text("Sağlıklı beslenme yolculuğunda sana eşlik edecek uzmanları inceleyebilir, detaylarına göz atabilir ve seans planlayabilirsin.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        
                        LazyVStack(spacing: 16) {
                            ForEach(doctors) { doctor in
                                DoctorCardView(doctor: doctor)
                            }
                        }
                        .padding(.bottom, 24)
                    }
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Diyetisyenler")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DoctorCardView: View {
    
    let doctor: Doctor
    
    var body: some View {
        HStack(alignment: .center, spacing: 14) {
            
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.green.opacity(0.18), Color.white],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 72, height: 72)
                
                Image(doctor.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(doctor.title)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.green)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.12))
                    .clipShape(Capsule())
                
                Text(doctor.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                
                Text("Fiyat: \(doctor.price) TL")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            NavigationLink(destination: DoctorPreview(doctor: doctor)) {
                HStack(spacing: 6) {
                    Text("İncele")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Image(systemName: "arrow.right")
                        .font(.caption.weight(.bold))
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    LinearGradient(
                        colors: [Color.green, Color.green.opacity(0.8)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .foregroundStyle(.white)
                .clipShape(Capsule())
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(Color.black.opacity(0.04), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)
        .padding(.horizontal)
    }
}

#Preview {
    DoctorsCard()
}
