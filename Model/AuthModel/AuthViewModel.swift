//
//  AuthViewModel.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 28.10.2025.
//

import Foundation
import FirebaseAuth

@MainActor
class AuthViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var displayName: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        user = Auth.auth().currentUser
        displayName = Self.resolveDisplayName(for: user)
    }
    
    func register(email: String, password: String, username: String) async {
        errorMessage = ""
        do{
            let user = try await AuthServices.shared.registerUser(email: email, password: password)
            try await AuthServices.shared.updateDisplayName(username, for: user)
            self.user = user
            self.displayName = username
            
        }catch{
            self.errorMessage = error.localizedDescription
        }
    }
    
    
    func login(email: String, password: String) async {
        errorMessage = ""
        do {
            let user = try await AuthServices.shared.loginUser(email: email, password: password)

            self.displayName = Self.resolveDisplayName(for: user)
            self.user = user
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    func logout() async {
        errorMessage = ""
        do {
            try await AuthServices.shared.logoutUser()
            self.user = nil
            self.displayName = ""
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    func googleWithLogin() async  {
        
    }
    
    private static func resolveDisplayName(for user: User?) -> String {
        guard let user else { return "" }
        if let profileName = user.displayName, !profileName.isEmpty {
            return profileName
        }
        if let email = user.email {
            return email.components(separatedBy: "@").first ?? "Kullanici"
        }
        return "Kullanici"
    }
}
