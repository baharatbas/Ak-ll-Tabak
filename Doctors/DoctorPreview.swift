//
//  DoctorPreview.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 23.02.2026.
//

import SwiftUI

struct DoctorPreview: View {
    let doctor: Doctor
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                
                ZStack {
                    LinearGradient(
                        colors: [
                            Color.green.opacity(0.18),
                            Color.white
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 230)
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    
                    VStack(spacing: 14) {
                        Image(doctor.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 4)
                            )
                            .shadow(color: .black.opacity(0.10), radius: 10, x: 0, y: 6)
                        
                        Text(doctor.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(doctor.title)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.green)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(Color.white.opacity(0.9))
                            .clipShape(Capsule())
                    }
                    .padding()
                }
                
                VStack(spacing: 16) {
                    
                    HStack(spacing: 14) {
                        bilgiKutusu(
                            ikon: "banknote",
                            baslik: "Seans Ücreti",
                            deger: "\(doctor.price) TL"
                        )
                        
                        bilgiKutusu(
                            ikon: "video.fill",
                            baslik: "Görüşme",
                            deger: "Online / Yüz yüze"
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Hakkında")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(doctor.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineSpacing(4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4)
                    
                    Button(action: {
                        
                    }) {
                        HStack {
                            Image(systemName: "calendar.badge.plus")
                            Text("Seans Al")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [Color.green, Color.green.opacity(0.8)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: .green.opacity(0.25), radius: 10, x: 0, y: 6)
                    }
                }
            }
            .padding()
        }
        .background(
            LinearGradient(
                colors: [
                    Color(.systemGroupedBackground),
                    Color.green.opacity(0.05),
                    Color.white
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func bilgiKutusu(ikon: String, baslik: String, deger: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: ikon)
                .font(.title3)
                .foregroundStyle(.green)
            
            Text(baslik)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(deger)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .topLeading)
        .padding(18)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4)
    }
}
