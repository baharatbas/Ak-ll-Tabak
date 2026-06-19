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
        ZStack {
            
            Color(.systemGray6)
                .opacity(0.45)
                .ignoresSafeArea()
            
            VStack(spacing: 7) {
                
                Spacer()
                
                VStack(spacing: 12) {
                    Image(systemName: "fork.knife.circle.fill")
                        .font(.system(size: 72))
                        .foregroundColor(.green)
                    
                    Text("AKILLI TABAK")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Sağlıklı yaşam yolculuğuna başla")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 18) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Kullanıcı Adı")
                            .font(.headline)
                        
                        TextField("Kullanıcı adı girin", text: $username)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("E-Posta")
                            .font(.headline)
                        
                        TextField("E-Posta girin", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Şifre")
                            .font(.headline)
                        
                        SecureField("Şifre girin", text: $password)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                    }
                    
                    Button {
                        Task {
                            await authViewModel.register(
                                email: email,
                                password: password,
                                username: username
                            )
                        }
                    } label: {
                        Text("Kayıt Ol")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 54)
                            .background(Color.green)
                            .cornerRadius(14)
                    }
                    .padding(.top, 6)
                }
                .padding(24)
                .background(Color.white)
                .cornerRadius(24)
                .shadow(
                    color: .black.opacity(0.08),
                    radius: 16,
                    x: 0,
                    y: 8
                )
                .padding(.horizontal, 22) // SignIn ile aynı
                
                NavigationLink {
                    personSıngIn()
                } label: {
                    Text("Zaten hesabım var, giriş yap")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                if !authViewModel.errorMessage.isEmpty {
                    Text(authViewModel.errorMessage)
                        .font(.footnote)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                
                HStack(spacing: 14) {
                    Button {
                        
                    } label: {
                        Image(systemName: "g.circle.fill")
                            .font(.system(size: 20))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "applelogo")
                            .font(.system(size: 20))
                    }
                }
                .foregroundStyle(.black)
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        personNavbar()
            .environmentObject(AuthViewModel())
    }
}
