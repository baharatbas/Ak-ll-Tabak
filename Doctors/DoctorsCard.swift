//
//  DoctorsCard.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 16.02.2026.
//

import SwiftUI

struct DoctorsCard: View {
    var body: some View {
        ScrollView{
            DoctorCardView(name: "Dr. BAHAR ATBAŞ", title: "Dr. BAHAR ATBAŞ", image: "profile1")
            DoctorCardView(name: "Dr. Baran Can Atbaş", title: "Dr. Baran Can ATBAŞ", image: "profile4")
            DoctorCardView(name: "Dr. Lara Çetrez", title: "Dr. Lara Çetrez", image: "profile3")
            DoctorCardView(name: "Dr. Beyza Konuker", title: "Dr. Beyza Konuker", image: "profile2")
            DoctorCardView(name: "Dr. Ece Yalçın", title: "Dr. Ece Yalçın", image: "profile5")
            DoctorCardView(name: "Dr. İrem Şimşek", title: "Dr. İrem Şimşek", image: "profile6")
            DoctorCardView(name: "Dr. Umay Gençer", title: "Dr. Umay Gençer", image: "profile7")
            DoctorCardView(name: "Dr. İlter Güneş", title: "Dr. İlter Güneş", image: "profile8")
            DoctorCardView(name: "Dr. Sedef Korkmaz", title: "Dr. Sedef Korkmaz", image: "profile9")
        }.padding()
    }
}

struct DoctorCardView: View {
    
    let name: String
    let title: String
    let image: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            
            // MARK: - Profil Foto
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            // MARK: - Ünvan + İsim
            VStack(alignment: .leading, spacing: 4) {
                
                Text(title) // Diyetisyen
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(name) // Dr. Bahar Atbaş
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            // MARK: - İncele Butonu
            Button(action: {
                // action
            }) {
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

