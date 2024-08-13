import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 3

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                DocListView()
                    .navigationTitle("Педиатры")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image("House")
                    .renderingMode(.template)
                Text("Главная")
            }
            .tag(0)

            PlaceholderView(message: "Здесь будут приёмы")
                .tabItem {
                    Image("Calendar")
                        .renderingMode(.template)
                    Text("Приёмы")
                }
                .tag(1)

            PlaceholderView(message: "Сообщений нет")
                .tabItem {
                    Image("Chat")
                        .renderingMode(.template)
                    Text("Чат")
                }
                .tag(2)

            PlaceholderView(message: "О себе")
                .tabItem {
                    Image("Profile")
                        .renderingMode(.template)
                    Text("Профиль")
                }
                .tag(3)
        }
        .accentColor(.accentColor)
    }
}

struct PlaceholderView: View {
    var message: String

    var body: some View {
            Text(message)
                .font(.subheadline)
                .padding()
    }
}
