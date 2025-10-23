import SwiftUI

struct Navbar: View {
    @State private var selectedTab = 2 // Ortadaki tab (Akıllı Tabak)

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                homeNavbar()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Anasayfa")
                    }
                    .tag(0)

                searchNavbar()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Arama")
                    }
                    .tag(1)

                meatAI()
                    .tabItem {
                        EmptyView() // burada boş bırakıyoruz, ortadaki butonu kendimiz ekleyeceğiz
                    }
                    .tag(2)

                category()
                    .tabItem {
                        Image(systemName: "receipt")
                        Text("Kategori")
                    }
                    .tag(3)

                personBarhome()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Hesabım")
                    }
                    .tag(4)
            }

            // Ortadaki büyük ikon
            Button(action: {
                selectedTab = 2
            }) {
                VStack {
                    Image(systemName: "camera.viewfinder")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.green).shadow(radius: 4))
                    Text("Akıllı Tabak")
                        .font(.caption)
                        .foregroundColor(selectedTab == 2 ? .green : .gray)
                        .bold()
                }
            }
            .offset(y:1) // ikon biraz yukarıda dursun
        }
        .accentColor(.green)
    }
}

#Preview {
    Navbar()
}
