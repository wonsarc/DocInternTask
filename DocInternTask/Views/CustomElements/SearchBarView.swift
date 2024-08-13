import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.customLightGray)
                .padding(.leading, 5)
            TextField("Поиск", text: $text)
                .foregroundColor(.customLightGray)
                .padding(.leading, 3)
        }
        .padding(5)
        .background(Color(.white))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.customGray, lineWidth: 1)
        )
    }
}
