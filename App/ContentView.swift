//
//  ContentView.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 14.10.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        Navbar()
            .environmentObject(authViewModel)
    }
}

#Preview {
    ContentView()
}
