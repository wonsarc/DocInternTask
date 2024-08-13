import SwiftUI

enum FilterOption: String, CaseIterable {
    case price = "По цене"
    case experience = "По стажу"
    case rating = "По рейтингу"
}

struct PickerView: View {
    @Binding var selectedFilter: FilterOption

    var body: some View {
        HStack(spacing: 0) {
            ForEach(FilterOption.allCases, id: \.self) { option in
                Button(action: {
                    selectedFilter = option
                }) {
                    HStack {
                        Text(option.rawValue)
                            .font(.system(size: 14))
                            .foregroundColor(selectedFilter == option ? .white : .customGray)

                        if option == selectedFilter {
                            Image("arrow")
                                .frame(width: 5, height: 10)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background(selectedFilter == option ? Color.accentColor : Color.white)
                    .border(Color.customGray, width: 1)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .background(Color(.white))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.customGray, lineWidth: 1)
        )
    }
}
