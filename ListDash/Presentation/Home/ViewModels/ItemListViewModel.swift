//
//  ItemListViewModel.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import Foundation
import Combine

class ItemListViewModel: ObservableObject {
    @Published var items: [ItemEntity] = []
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let getItemsUseCase: GetItemsUseCase
    
    init(getItemsUseCase: GetItemsUseCase) {
        self.getItemsUseCase = getItemsUseCase
        fetchItems()
    }
    
    func fetchItems() {
        getItemsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { items in
                self.items = items
            })
            .store(in: &cancellables)
    }
    
    func deleteItem(at index: Int) {
        items.remove(at: index)
    }
}

