import SwiftUI

class HomeCoordinator: ObservableObject {
    private let viewModel: ItemListViewModel
    
    init(viewModel: ItemListViewModel) {
        self.viewModel = viewModel
    }
    
    func makeHomeView() -> some View {
        NavigationView {
            HomeView(viewModel: viewModel)
        }
        .navigationViewStyle(.stack)
    }
} 