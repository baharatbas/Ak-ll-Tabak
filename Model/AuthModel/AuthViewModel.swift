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
    @Published var errorMessage: String = ""
    
    func register(email: String, password: String) async  {
        do{
            let user = try await AuthServices.shared.registerUser(email: email, password: password)
            self.user = user
            
        }catch{
            self.errorMessage = error.localizedDescription
        }
    }
    
    
    func Login(email: String, password: String) async  {
        do{
            let user = try await AuthServices.shared.loginUser(email: email, password: password)
            self.user = user
        }catch{
            self.errorMessage = error.localizedDescription
            
        }
        
    }
    
    func logout() async  {
        do{
            try await AuthServices.shared.logoutUser()
            self.user = nil
        }catch{
            self.errorMessage = error.localizedDescription
            
        }
        
    }
    
    func googleWithLogin() async  {
        
    }
}
