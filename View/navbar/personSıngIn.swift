//
//  personSıngIn.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 21.10.2025.
//

import SwiftUI

struct personSıngIn: View{
    @StateObject private var authViewModel = AuthViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var isRegister = false

   var body: some View{
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
           
           VStack{
               Button(action: {
                   Task{
                       await authViewModel.Login(email: email, password: password)
                       
                       if authViewModel.errorMessage.isEmpty{
                           isRegister = true
                       }
                   }
               }) {
                   Text("Giriş Yap")
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(Color.green)
                       .foregroundColor(.white)
                       .cornerRadius(10)
                       .font(.headline)
               }
               .padding(.horizontal)
               NavigationLink(destination: HomeView(), isActive: $isRegister) {
                   EmptyView()
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
           }
       }
    }
}

#Preview {
    personSıngIn()
    
}
