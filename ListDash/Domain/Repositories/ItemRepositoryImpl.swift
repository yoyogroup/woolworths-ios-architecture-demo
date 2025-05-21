//
//  ItemRepositoryImpl.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import Foundation
import Combine

protocol ItemRepositoryProtocol {
    func getItems() -> AnyPublisher<[ItemEntity], Error>
}

class ItemRepositoryImpl: ItemRepositoryProtocol {
    
    private let api: ItemAPIProtocol
    
    init(api: ItemAPIProtocol) {
        self.api = api
    }
    
    func getItems() -> AnyPublisher<[ItemEntity], any Error> {
        return api.fetchItems()
            .map { itemModels in
                itemModels.map { itemModels in
                    ItemEntity(name: itemModels.itemName,
                               imageURL: itemModels.itemImage,
                               description: itemModels.itemDescription,
                               price: itemModels.itemPrice)
                    
                }
            }
            .eraseToAnyPublisher()
    }
    
}
