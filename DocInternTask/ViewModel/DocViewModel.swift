import Foundation
import Combine

class DoctorViewModel: ObservableObject {
    @Published var doctors: [UserModel] = []
    @Published var showingError = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let doctorsService = DocService()


    func fetchDoctors() {
        doctorsService.fetchDoctors()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showingError = true
                }
            }, receiveValue: { [weak self] users in
                self?.doctors = users
            })
            .store(in: &cancellables)
    }
}
