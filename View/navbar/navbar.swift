import SwiftUI

struct Navbar: View {
    @State private var selectedTab = 0
    @StateObject private var tabBarManager = TabBarVisibilityManager()

    var body: some View {
        ZStack(alignment: .bottom) {

            TabView(selection: $selectedTab) {

                NavigationStack {
                    homeNavbar()
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Anasayfa")
                }
                .tag(0)

                NavigationStack {
                    analizNavbar()
                }
                .tabItem {
                    Image(systemName: "person.text.rectangle")
                    Text("Analiz")
                }
                .tag(1)

                NavigationStack {
                    meatAI()
                }
                .tabItem {
                    EmptyView()
                }
                .tag(2)

                NavigationStack {
                    Diyet()
                }
                .tabItem {
                    Image(systemName: "stethoscope")
                    Text("Diyet")
                }
                .tag(3)

                NavigationStack {
                    personBarhome()
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Hesabım")
                }
                .tag(4)
            }

            if !tabBarManager.hideCenterButton {
                Button {
                    selectedTab = 2
                } label: {
                    VStack {
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Circle()
                                    .fill(Color.green)
                                    .shadow(radius: 4)
                            )

                        Text("Akıllı Tabak")
                            .font(.caption)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                .offset(y: 4)
            }
        }
        .accentColor(.green)
        .environmentObject(tabBarManager)
    }
}

#Preview {
    Navbar()
}
