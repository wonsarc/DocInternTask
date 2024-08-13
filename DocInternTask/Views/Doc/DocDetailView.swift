import SwiftUI

struct DocDetailView: View {
    var doctor: UserModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
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
                }
            }


            HStack( spacing: 12) {
                Image("time")
                Text("Опыт работы: \(doctor.seniority) лет")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

            }

            HStack(spacing: 12) {
                Image("spec")
                Text("\(doctor.scientificDegreeLabel)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            HStack(spacing: 12) {
                Image("education")
                Text("\(doctor.higherEducation.first?.university ?? "-")")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            HStack(spacing: 12) {
                Image("geoTag")
                Text("\(doctor.workExpirience.last?.organization ?? "Онлайн")")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            /// Кнопка цена
            Button(action: {
                print("Открываем цены")
            }) {
                HStack {
                    Text("Стоимость услуг")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("от \(doctor.minimumPrice) ₽")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
                .cornerRadius(8)
            }
            Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                .font(.system(size: 14))

            Spacer()

            /// Кнопка Записаться
            Button(action: {
                print("Запрос на запись отправлен!")
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
        .padding(.top, 16)
        .navigationTitle("Педиатр")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.customLightGray)
    }
}
