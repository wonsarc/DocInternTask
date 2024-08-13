import SwiftUI

struct RatingView: View {
    var rating: Double

    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                if index < Int(rating) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 12))
                } else if index < Int(rating.rounded()) {
                    Image(systemName: "star.lefthalf.fill")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 12))
                } else {
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
            }
        }
    }
}
