//
//  MockApi.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import Foundation
import Combine

protocol ItemAPIProtocol {
    func fetchItems() -> AnyPublisher<[ItemModel], Error>
}

class MockAPI: ItemAPIProtocol {
    func fetchItems() -> AnyPublisher<[ItemModel], any Error>{
        let jsonData =
        """
        [
            {
                "itemName": "Apple",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/3/34/Apples_with_black_background.jpg",
                "itemDescription": "Fresh and juicy apples.",
                "itemPrice": 1.20
            },
            {
                "itemName": "Banana",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/3/31/Cavendish_banana_from_Maracaibo.jpg",
                "itemDescription": "Ripe bananas, perfect for snacking.",
                "itemPrice": 0.50
            },
            {
                "itemName": "Carrot",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/2/22/Carrots_at_a_farmers_market_in_the_Villages_Florida.png",
                "itemDescription": "Crunchy and sweet carrots.",
                "itemPrice": 0.80
            },
            {
                "itemName": "Bread",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/c/c7/Korb_mit_Br%C3%B6tchen.JPG",
                "itemDescription": "Whole grain bread loaf.",
                "itemPrice": 2.50
            },
            {
                "itemName": "Milk",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/2/28/Milk_001.JPG",
                "itemDescription": "1 liter of fresh milk.",
                "itemPrice": 1.00
            },
            {
                "itemName": "Eggs",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/7/73/A_Tray_Of_Eggs.jpg",
                "itemDescription": "A dozen organic eggs.",
                "itemPrice": 3.00
            },
            {
                "itemName": "Cheese",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/a/a8/Cheese_platter.jpg",
                "itemDescription": "Cheddar cheese block.",
                "itemPrice": 4.00
            },
            {
                "itemName": "Tomato",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg",
                "itemDescription": "Fresh tomatoes.",
                "itemPrice": 1.50
            },
            {
                "itemName": "Chicken Breast",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/e/ee/Chicken_breast_with_lemon_sauce_%2817238222455%29.jpg",
                "itemDescription": "Boneless chicken breast.",
                "itemPrice": 5.00
            },
            {
                "itemName": "Orange Juice",
                "itemImage": "https://upload.wikimedia.org/wikipedia/commons/6/6a/Orange_Juice_%2813638538444%29.jpg",
                "itemDescription": "1 liter of orange juice.",
                "itemPrice": 2.00
            }
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        return Just(jsonData)
            .tryMap { data in
                try decoder.decode([ItemModel].self, from: data)
            }
            .eraseToAnyPublisher()
    }
    
}
