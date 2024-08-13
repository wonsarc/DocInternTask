import Alamofire
import Combine
import Foundation

class DocService {

    private let url = "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4"

    func fetchDoctors() -> AnyPublisher<[UserModel], AFError> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return AF.request(self.url, method: .get)
            .validate()
            .publishDecodable(type: ResponseModel.self, decoder: decoder)
            .value()
            .map { $0.record.data.users }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
