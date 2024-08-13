import Foundation

struct RecordModel: Codable {
    let count: Int
    let previous: String?
    let message: String
    let errors: String?
    let data: DataModel
}
