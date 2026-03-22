//
//  sıngınUser.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 15.02.2026.
//

import Foundation
import SwiftUI

struct sıngınUser: View {
    @EnvironmentObject private var authViewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("Hoş Geldin")
                .font(.title2)
                .foregroundColor(.gray)

            Text(authViewModel.displayName.isEmpty ? "Kullanıcı" : authViewModel.displayName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Spacer()

            Button {
                Task {
                    await authViewModel.logout()
                }
            } label: {
                Text("Çıkış Yap")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .padding()
    }
}
#Preview {
    sıngınUser()
        .environmentObject(AuthViewModel())
}
