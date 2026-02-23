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
            ScrollView {
                ForEach(doctors) { doctor in
                    DoctorCardView(doctor: doctor)
                }
            }
            .navigationTitle("Diyetisyenler")
        }
    }
}

struct DoctorCardView: View {
    
    let doctor: Doctor
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            
            Image(doctor.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(doctor.title)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(doctor.name)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            NavigationLink(destination: DoctorPreview(doctor: doctor)) {
                Text("İNCELE")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 4)
        .padding(.horizontal)
    }
}
#Preview {
    DoctorsCard()
}

