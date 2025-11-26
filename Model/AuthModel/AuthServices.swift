//
//  AuthServices.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 28.10.2025.
//

import Foundation
import FirebaseCore
import FirebaseAuth

final class AuthServices {
    
    static let shared = AuthServices()
    
    //dışarıdan yeni bir auth servis oluşturulmasın diye yani tek olması için.
    private init() {}
    
    //Kullanıcı kayıt fonksiyonu
    func registerUser(email: String, password: String) async throws -> User{
        //firebase kayıt isteği gönderme
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        //firebase den dönen kullanıcıyı alıyoruz
        let user = result.user
        //kayıt olduktan sonra kullanıcı doğrulama maili gönderme işlemi
                //await user.sendEmailVerification()
        //kullanıcı döndürürüz
        return user
    }
    
    //Giriş yapma fonksiyonu
    func loginUser(email: String, password: String) async throws -> User {
        //firebase ' e giriş isteği gönderiyoruz.
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        //giriş yapan kullanıcıyı alıyoruz
        return result.user
    }
    
    //Çıkış yapma fonksiyonu
    func logoutUser() async throws {
        //çıkış işlemi
        try Auth.auth().signOut()
    }
    
    //şuanda giriş yapmış kullanıcıyı döner/gösterir.
    func currentUser() async throws -> User?{
        return Auth.auth().currentUser
    }
        
        
    
}
