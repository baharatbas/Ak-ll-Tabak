//
//  personNavbar.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 15.10.2025.
//

import SwiftUI

struct personNavbar: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30){
                Text("AKILLI TABAK")
                    .bold()
                    .font(.title)
                //Text("KAYIT OL")
                VStack(alignment: .leading, spacing: 15) {
                    Text("Kullanıcı Adı")
                        .font(.headline)
                    TextField("Kullanıcı adı girin", text: $username)
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
                }.padding(.horizontal)
                
                Button(action: {
                    Task {
                        await authViewModel.register(email: email, password: password, username: username)
                    }
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
                
                VStack{
                    NavigationLink(destination: personSıngIn()) {
                        Text("Zaten Hesabım Var Giriş Yap")
                    }
                    .foregroundColor(.gray)
                    if !authViewModel.errorMessage.isEmpty {
                        Text(authViewModel.errorMessage)
                            .font(.footnote)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    HStack{
                        Button(action: {
                            
                        }){
                            Image(systemName: "g.circle.fill")
                                .frame(width: 24, height: 24)
                        }
                        Button(action: {
                            
                        }){
                            Image(systemName: "applelogo")
                                .frame(width: 50, height: 50)
                        }
                    }.foregroundStyle(Color.black)
                }}
        }
    }
}
#Preview {
    personNavbar()
        .environmentObject(AuthViewModel())
}

