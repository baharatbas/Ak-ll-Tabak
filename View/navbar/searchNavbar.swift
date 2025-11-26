//
//  searchNavbar.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 15.10.2025.
//

import SwiftUI

struct searchNavbar: View {
    @State private var searchText = ""
    let items = ["Elma", "Armut", "Muz", "Çilek", "Karpuz", "Kiraz"]
    var body: some View {
        NavigationView {
                    VStack {
                       
                        

                    }
                    .navigationTitle("Arama")
                    .searchable(text: $searchText, prompt: "Bir şey ara...")
                }
            
        
    }
}

#Preview {
    searchNavbar()
}
