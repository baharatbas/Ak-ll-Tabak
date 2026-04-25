//
//  personNavbar.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 15.10.2025.
//

import SwiftUI

struct personNavbar: View {
    @ObservedObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                Text("AKILLI TABAK")
                    .bold()
                    .font(.title)
                //Text("KAYIT OL")
                VStack(alignment: .leading, spacing: 15) {
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
                    isLoading = true
                    authViewModel.errorMessage = ""
                    Task{
                        await authViewModel.register(email: email, password: password)
                        isLoading = false
                    }
                    
                }) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    } else {
                        Text("Kayıt Ol")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.headline)
                    }
                }
                .padding(.horizontal)
                .disabled(isLoading)
                
                if !authViewModel.errorMessage.isEmpty {
                    Text(authViewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.top, 5)
                }
                
                VStack{
                    NavigationLink(destination: personSıngIn(authViewModel: authViewModel)) {
                        Text("Zaten Hesabım Var Giriş Yap")
                    }
                    .foregroundColor(.gray)
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
            .onChange(of: authViewModel.user) { _, user in
                if user != nil {
                    dismiss()
                }
            }
        }
    }
}
#Preview {
    personNavbar(authViewModel: AuthViewModel())
}

