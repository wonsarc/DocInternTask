import SwiftUI

struct DocView: View {
    let doctor: UserModel

    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .top, spacing: 16) {
                /// Аватар
                if let avatarURL = doctor.avatar, let url = URL(string: avatarURL) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                } else {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        )
                }

                VStack(alignment: .leading, spacing: 10) {
                    /// ФИО
                    Text("\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic ?? "")")
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .truncationMode(.tail)

                    /// Рейтинг
                    RatingView(rating: doctor.ratingsRating)

                    /// Специальность и стаж
                    Text("Педиатр・стаж \(doctor.seniority) лет")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)

                    /// Цена
                    Text("Цена от \(doctor.minimumPrice) ₽")
                        .font(.system(size: 16, weight: .bold))
                }

                Spacer()

                /// Кнопка избранное
                Button(action: {
                }) {
                    Image("Like").renderingMode(.template)
                        .foregroundColor(doctor.isFavorite ? .red : .gray)
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.top, 20)
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 10)

            /// Кнопка Записаться
            Button(action: {
            }) {
                Text("Записаться")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.accent)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.customLightGray, lineWidth: 1)
        )
        .padding(.vertical, 8)
    }
}
