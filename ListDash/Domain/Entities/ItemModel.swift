//
//  ItemModdel.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import Foundation

struct ItemModel: Decodable {
    let itemName: String
    let itemImage: String
    let itemDescription: String
    let itemPrice: Double
}
