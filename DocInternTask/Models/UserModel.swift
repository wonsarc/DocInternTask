import Foundation

struct UserModel: Codable, Identifiable {
    let id: UUID
    let firstName: String
    let patronymic: String?
    let lastName: String
    let ratingsRating: Double
    let seniority: Int
    let textChatPrice: Int
    let videoChatPrice: Int
    let homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let higherEducation: [HigherEducationModel]
    let workExpirience: [WorkExpirienceModel]
    let rank: Int
    let scientificDegreeLabel: String
    let isFavorite: Bool

    var minimumPrice: Int {
        return min(textChatPrice, videoChatPrice, homePrice, hospitalPrice)
    }
}
