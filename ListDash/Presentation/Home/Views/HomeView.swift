import SwiftUI

struct HomeView: View {
    let viewModel: ItemListViewModel
    
    var body: some View {
        ItemListView(viewModel: viewModel)
            .navigationTitle("Groceries")
    }
}

#Preview {
    HomeView(viewModel: ItemListViewModel(getItemsUseCase: GetItemsUseCase(repository: ItemRepositoryImpl(api: MockAPI()))))
} 