//
//  ItemRepositoryImpl.swift
//  ListDash
//
//  Created by Islam Abd El-Rahiem on 22/05/2025.
//

import Foundation
import Combine

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
