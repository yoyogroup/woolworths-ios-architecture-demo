import SwiftUI

struct MainTabView: View {
    let viewModel: ItemListViewModel
    @StateObject private var coordinator: MainCoordinator
    
    init(viewModel: ItemListViewModel) {
        self.viewModel = viewModel
        _coordinator = StateObject(wrappedValue: MainCoordinator(viewModel: viewModel))
    }
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            coordinator.homeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(coordinator.homeTab)
            
            coordinator.settingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(coordinator.settingsTab)
        }
    }
}

#Preview {
    MainTabView(viewModel: ItemListViewModel(getItemsUseCase: GetItemsUseCase(repository: ItemRepositoryImpl(api: MockAPI()))))
} 