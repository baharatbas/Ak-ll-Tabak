//
//  personBarHome.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 21.10.2025.
//

import SwiftUI
import FirebaseAuth

struct personBarhome: View{
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack{
            if let user = authViewModel.user {
                // Kullanıcı giriş yaptıysa profesyonel profil sayfasını göster
                ProfileView(user: user, authViewModel: authViewModel)
            } else {
                ZStack(alignment: .bottom) {
                    Image("akıllıTabak")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(edges: .top)
                    
                    
                    HStack(spacing: 20) {
                        NavigationLink(destination: personNavbar(authViewModel: authViewModel))  {
                            Text("Kayıt Ol")
                                .frame(width: 140, height: 45)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .fontWeight(.semibold)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.green, lineWidth: 2)
                                )
                        }
                        
                        NavigationLink(destination: personSıngIn(authViewModel: authViewModel)) {
                            Text("Giriş Yap")
                                .frame(width: 140, height: 45)
                                .background(Color.white)
                                .foregroundColor(.green)
                                .cornerRadius(12)
                                .fontWeight(.semibold)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.green, lineWidth: 2)
                                )
                        }
                    }
                    .padding(.bottom, 70)
                }
                .navigationBarHidden(true)
            }
        }
    }
}

// MARK: - Profesyonel Profil Görünümü
struct ProfileView: View {
    let user: FirebaseAuth.User
    @ObservedObject var authViewModel: AuthViewModel
    @State private var isShowingLogoutAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Profil Fotoğrafı ve İsim Alanı
                VStack(spacing: 15) {
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .overlay(
                            Circle()
                                .stroke(Color.green.opacity(0.8), lineWidth: 4)
                        )
                        .padding(.top, 40)
                    
                    Text("Bahar") // Kullanıcı adını buraya çekebiliriz, şimdilik statik
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(user.email ?? "E-Posta Yok")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Divider()
                    .padding(.horizontal)
                
                // Seçenekler (Ayarlar) Listesi
                VStack(spacing: 15) {
                    ProfileOptionRow(icon: "person.crop.circle", title: "Hesap Bilgileri")
                    ProfileOptionRow(icon: "bell", title: "Bildirimler")
                    ProfileOptionRow(icon: "lock", title: "Gizlilik ve Güvenlik")
                    ProfileOptionRow(icon: "questionmark.circle", title: "Yardım ve Destek")
                }
                .padding(.horizontal)
                
                Spacer(minLength: 40)
                
                // Çıkış Yap Butonu
                Button(action: {
                    isShowingLogoutAlert = true
                }) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Çıkış Yap")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .foregroundColor(.red)
                    .cornerRadius(12)
                    .font(.headline)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                .alert("Çıkış Yap", isPresented: $isShowingLogoutAlert) {
                    Button("İptal", role: .cancel) { }
                    Button("Çıkış Yap", role: .destructive) {
                        Task {
                            await authViewModel.logout()
                        }
                    }
                } message: {
                    Text("Hesabınızdan çıkış yapmak istediğinize emin misiniz?")
                }
            }
        }
        .navigationTitle("Profilim")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileOptionRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.green)
                    .frame(width: 30)
                
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}
#Preview {
    personBarhome()
}
