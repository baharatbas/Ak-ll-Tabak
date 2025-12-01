//
//  homeView.swift
//  AkıllıTabak
//
//  Created by Bahar Atbaş on 24.10.2025.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 15) {
                    Image("profile")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("Merhaba")
                            .foregroundColor(.gray)
                        Text("Bahar")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "bell")
                        .font(.title3)
                }
                .padding(.horizontal)
                
                
                // MARK: Search + Assistant Button
                HStack {
                    TextField("Describe your food", text: .constant(""))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15)
                    
                    NavigationStack{
                        NavigationLink(destination: ChatBotView()) {
                            HStack {
                                Text("Assistant")
                                Image(systemName: "wand.and.sparkles")
                            }
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        }
                    }
                }
                .padding(.horizontal)
                
                
                // MARK: Categories
                HStack {
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text("See all")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        CategoryItem(name: "Vegan")
                        CategoryItem(name: "Carb")
                        CategoryItem(name: "Protein")
                        CategoryItem(name: "Snacks")
                        CategoryItem(name: "Drink")
                    }
                    .padding(.horizontal)
                }
                
                
                // MARK: Meals Grid Example
                VStack(spacing: 20) {
                    MealCardView(title: "Chicken Salad", kcal: 480, image: "meal1")
                    MealCardView(title: "Herb Omelette", kcal: 300, image: "meal2")
                    MealCardView(title: "Chicken Salad", kcal: 480, image: "meal1")
                    MealCardView(title: "Herb Omelette", kcal: 300, image: "meal2")
                }
                .padding(.horizontal)
                
            }
            .padding(.vertical)
        }
    }
}

struct CategoryItem: View {
    let name: String
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 70, height: 70)
                .overlay(Image(systemName: "drink"))
            
            Text(name)
                .font(.caption)
        }
    }
}

struct MealCardView: View {
    let title: String
    let kcal: Int
    let image: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .cornerRadius(15)
            
            Text(title)
                .fontWeight(.semibold)
            
            Text("\(kcal) kcal")
                .foregroundColor(.gray)
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "fork.knife")
                    Text("Bana Tarifini Ver")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 3)
    }
}



#Preview {
    HomeView()
}

