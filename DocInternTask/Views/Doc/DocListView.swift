import Combine
import SwiftUI

struct DocListView: View {
    @StateObject private var viewModel = DoctorViewModel()
    @State private var searchText = ""
    @State private var selectedFilter: FilterOption = .price
    @State private var selectedDoctor: UserModel?
    @State private var isDetailViewActive = false

    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    SearchBar(text: $searchText)
                    PickerView(selectedFilter: $selectedFilter)
                }
                .padding(.horizontal)

                Group {

                    if viewModel.doctors.isEmpty && !viewModel.showingError {
                        ProgressView("Загрузка...")
                            .padding()
                    }

                    List(viewModel.doctors) { doctor in
                        DocView(doctor: doctor)
                            .listRowInsets(EdgeInsets())
                            .background(.customLightGray)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                selectedDoctor = doctor
                                isDetailViewActive = true
                            }
                    }
                    .onAppear {
                        viewModel.fetchDoctors()
                    }
                    .alert(isPresented: $viewModel.showingError) {
                        Alert(
                            title: Text("Ошибка"),
                            message: Text(viewModel.errorMessage ?? "Неизвестная ошибка"),
                            dismissButton: .default(Text("ОК"))
                        )
                    }
                    .padding(.horizontal)
                    .listStyle(PlainListStyle())
                }
            }
        }
        .background(.customLightGray)
        .navigationDestination(isPresented: $isDetailViewActive) {
            if let doctor = selectedDoctor {
                DocDetailView(doctor: doctor)
            }
        }
    }
}
