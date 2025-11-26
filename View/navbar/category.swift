//
//  category.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 15.10.2025.
//

import SwiftUI
struct category:View {
    let categories: [Category] = [
           Category(name: "Kahvaltı", image: "sun.max.fill"),
           Category(name: "Öğle Yemeği", image: "fork.knife"),
           Category(name: "Akşam Yemeği", image: "moon.fill"),
           Category(name: "Tatlılar", image: "birthday.cake"),
           Category(name: "İçecekler", image: "cup.and.saucer.fill"),
           Category(name: "Atıştırmalıklar", image: "bag.fill")
       ]
    
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
       
    var body: some View {
        NavigationView {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(categories) { category in
                                NavigationLink(destination: Text("\(category.name) sayfası yakında 🍽️")) {
                                    VStack(spacing: 10) {
                                        Image(systemName: category.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.green.opacity(0.8))
                                            .clipShape(Circle())
                                        
                                        Text(category.name)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                    }
                                    .frame(maxWidth: .infinity, minHeight: 130)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(20)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 3)
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Kategoriler")
                }
    }
}
#Preview {
    category()
}
