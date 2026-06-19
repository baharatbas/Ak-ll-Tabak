import SwiftUI

enum CategoryType: Identifiable {
    case vegan
    case carb
    case protein
    case snacks
    case drink

    var id: Self { self }
}

struct HomeView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    @State private var selectedCategory: CategoryType?

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 25) {

                // MARK: Header
                HStack(spacing: 15) {
                    Group {
                        if let image = profileViewModel.image() {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                        } else {
                            ZStack {
                                Circle()
                                    .fill(Color(.systemGray5))

                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(8)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text("Merhaba")
                            .foregroundColor(.gray)

                        Text(authViewModel.displayName.isEmpty ? "Kullanıcı" : authViewModel.displayName)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }

                    Spacer()

                    NavigationLink {
                        ChatBotView()
                    } label: {
                        HStack {
                            Text("Assistant")
                            Image(systemName: "wand.and.sparkles")
                        }
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    }
                }
                .padding(.horizontal)



                // MARK: Categories
                HStack {
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)

                    Spacer()

                   /* Text("See all")
                        .foregroundColor(.gray)*/
                }
                .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {

                        Button {
                            selectedCategory = .vegan
                        } label: {
                            CategoryItem(name: "Vegan", imageName: "vegan")
                        }

                        Button {
                            selectedCategory = .carb
                        } label: {
                            CategoryItem(name: "Carb", imageName: "grad")
                        }

                        Button {
                            selectedCategory = .protein
                        } label: {
                            CategoryItem(name: "Protein", imageName: "protein")
                        }

                        Button {
                            selectedCategory = .snacks
                        } label: {
                            CategoryItem(name: "Snacks", imageName: "snak")
                        }

                        Button {
                            selectedCategory = .drink
                        } label: {
                            CategoryItem(name: "Drink", imageName: "drink1")
                        }
                    }
                   // .buttonStyle(.plain)
                    .padding(.horizontal)
                }


                // MARK: Meals
                VStack(spacing: 20) {
                    MealCardView(title: "Herb Omelette", kcal: 300, image: "meal2", type: .omelette)
                    MealCardView(title: "Chicken Salad", kcal: 480, image: "meal1", type: .chicken)
                    MealCardView(title: "Avacado Toast", kcal: 350, image: "avocadotoast", type: .avacado)
                    MealCardView(title: "Quinoa Veggie", kcal: 400, image: "quinoabowl", type: .quinoa)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationDestination(item: $selectedCategory) { category in
            switch category {
            case .vegan:
                VeganCategoryView()

            case .carb:
                CarbCategoryView()

            case .protein:
                ProteinCategoryView()

            case .snacks:
                SnacksCategoryView()

            case .drink:
                DrinkCategoryView()
            }
        }
    }
}

struct CategoryItem: View {
    let name: String
    let imageName: String

    var body: some View {
        VStack(spacing: 8) {

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                )

            Text(name)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
    }
}

struct MealCardView: View {
    let title: String
    let kcal: Int
    let image: String
    let type: MealType

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

            NavigationLink {
                destinationView()
            } label: {
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

    @ViewBuilder
    private func destinationView() -> some View {
        switch type {
        case .omelette:
            HerbOmelette()

        case .chicken:
            ChickenSalad()

        case .avacado:
            AvocadoToastView()

        case .quinoa:
            QuinoaVeggieView()
        }
    }
}

enum MealType {
    case chicken
    case omelette
    case avacado
    case quinoa
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}
