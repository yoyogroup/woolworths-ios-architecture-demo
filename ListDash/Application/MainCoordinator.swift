import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var selectedTab: Int = 0
    
    // Tab bar items
    let homeTab = 0
    let settingsTab = 1
    
    // Child coordinators
    private let homeCoordinator: HomeCoordinator
    private let settingsCoordinator: SettingsCoordinator
    
    init(viewModel: ItemListViewModel) {
        self.homeCoordinator = HomeCoordinator(viewModel: viewModel)
        self.settingsCoordinator = SettingsCoordinator()
    }
    
    // View builders for each tab
    func homeView() -> some View {
        homeCoordinator.makeHomeView()
    }
    
    func settingsView() -> some View {
        settingsCoordinator.makeSettingsView()
    }
} 