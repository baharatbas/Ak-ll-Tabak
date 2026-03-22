import SwiftUI

struct Navbar: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                homeNavbar()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Anasayfa")
                    }
                    .tag(0)

                analizNavbar()
                    .tabItem {
                        Image(systemName: "person.text.rectangle")
                        Text("Analiz")
                    }
                    .tag(1)

                meatAI()
                    .tabItem {
                        EmptyView()
                    }
                    .tag(2)

                DoctorsCard()
                    .tabItem {
                        Image(systemName: "stethoscope")
                        Text("Danışman")
                    }
                    .tag(3)

                personBarhome()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Hesabım")
                    }
                    .tag(4)
            }

                Button(action: {
                    selectedTab = 2
                }) {
                    VStack {
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(Color.green).shadow(radius: 4))

                        Text("Akıllı Tabak")
                            .font(.caption)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                .offset(y: 4)
            
        }
        .accentColor(.green)
    }
}

#Preview {
    Navbar()
}
