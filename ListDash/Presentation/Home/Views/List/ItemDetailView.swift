//
//  ItemDetailView.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import Foundation
import SwiftUI

struct ItemDetailView: View {
    let item: ItemEntity
    
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: item.imageURL)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if phase.error != nil {
                    // Placeholder in case of an error
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                } else {
                    // Placeholder while loading
                    ProgressView()
                        .frame(width: 200, height: 200)
                }
            }

            Text(item.name)
                .font(.title)
                .bold()

            Text(String(format: "R%.2f", item.price)) // Show price in the format
                .font(.title2)
                .foregroundColor(.blue)

            Text(item.description)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(item.name)
    }
}
