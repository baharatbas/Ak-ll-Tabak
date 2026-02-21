
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    // MARK: Header
                    HStack(spacing: 15) {
                        Image("profile1")
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
                    
                    
                    // MARK: Search + Assistant
                    HStack {
                        TextField("Describe your food", text: .constant(""))
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(15)
                        
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
                            CategoryItem(name: "Vegan", imageName: "drink1")
                            CategoryItem(name: "Carb", imageName: "grad")
                            CategoryItem(name: "Protein", imageName: "protein")
                            CategoryItem(name: "Snacks", imageName: "snak")
                            CategoryItem(name: "Drink", imageName: "drink1")
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    // MARK: Meals
                    VStack(spacing: 20) {
                        MealCardView(title: "Chicken Salad", kcal: 480, image: "meal1")
                        MealCardView(title: "Herb Omelette", kcal: 300, image: "meal2")
                    }
                    .padding(.horizontal)
                    
                    
                    // MARK: Diets Section
                    HStack {
                        Text("Diets")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        NavigationLink(destination: Diyet()) {
                            Text("See all")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    Diyet(limit: 10)
                        .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
    }
}




struct CategoryItem: View {
    let name: String
    let imageName: String
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 70, height: 70)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                    
                    )
            
            
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
