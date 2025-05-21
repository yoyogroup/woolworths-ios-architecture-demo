//
//  ListDashApp.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import SwiftUI

@main
struct ListDashApp: App {
    
    // Set up the necessary dependencies here
    let api = MockAPI() // Replace with real API implementation if needed
    let repository: ItemRepositoryProtocol
    let useCase: GetItemsUseCase
    let viewModel: ItemListViewModel
    
    init() {
        // Initialize repository and use case
        repository = ItemRepositoryImpl(api: api)
        useCase = GetItemsUseCase(repository: repository)
        // Initialize view model
        viewModel = ItemListViewModel(getItemsUseCase: useCase)
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView(viewModel: viewModel)
        }
    }
}

