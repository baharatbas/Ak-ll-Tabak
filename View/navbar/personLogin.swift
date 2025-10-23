//
//  personNavbar.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 15.10.2025.
//

import SwiftUI

struct personNavbar: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                Text("AKILLI TABAK")
                    .bold()
                    .font(.title)
                //Text("KAYIT OL")
                VStack(alignment: .leading, spacing: 15) {
                    Text("Ad Soyad")
                        .font(.headline)
                    TextField("Adınızı girin", text: $name)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    Text("E-Posta")
                        .font(.headline)
                    TextField("E-Posta girin", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    Text("Şifre")
                        .font(.headline)
                    SecureField("Şifre girin", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    Text("Şifre Tekarı")
                        .font(.headline)
                    SecureField("Şifre tekrarı", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }.padding(.horizontal)
                
                Button(action: {
                                // Kayıt işlemleri burada yapılacak
                            }) {
                                Text("Kayıt Ol")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .font(.headline)
                            }
                            .padding(.horizontal)
                            
                            NavigationLink(destination: personSıngIn()) {
                                Text("Zaten Hesabım Var")
                            }
                            .foregroundColor(.gray)
            }
        }
    }
}
#Preview {
    personNavbar()
}

