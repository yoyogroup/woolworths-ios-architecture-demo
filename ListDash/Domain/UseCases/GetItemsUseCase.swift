//
//  GetItemsUseCase.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import Foundation
import Combine

class GetItemsUseCase {
    private let repository: ItemRepositoryProtocol
    
    init(repository: ItemRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[ItemEntity], Error> {
        return repository.getItems()
    }
}
