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
        VStack(spacing: 20) {
                    
                    Image(doctor.image)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                    Text(doctor.name)
                        .font(.title)
                        .bold()
                    
                    Text(doctor.title)
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text("Fiyat: \(doctor.price, specifier: "%.0f") TL")
                        .font(.title3)
                        .foregroundColor(.green)
                    
                    Text(doctor.description)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .padding()
            }
    }


