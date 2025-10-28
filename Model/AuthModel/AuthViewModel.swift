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
        
    }
    
    
    func Login(email: String, password: String) async  {
        
    }
    
    func logout() async  {
        
    }
}
