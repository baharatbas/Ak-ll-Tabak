//
//  ProfileViewModel.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 14.06.2026.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var profileImageData: Data?

    func loadProfileImage(for userKey: String) {
        profileImageData = UserDefaults.standard.data(forKey: "profileImage_\(userKey)")
    }

    func saveProfileImage(_ data: Data, for userKey: String) {
        profileImageData = data
        UserDefaults.standard.set(data, forKey: "profileImage_\(userKey)")
    }

    func clearProfileImage() {
        profileImageData = nil
    }
    func image() -> UIImage? {
        guard let profileImageData else { return nil }
        return UIImage(data: profileImageData)
    }
    
}
