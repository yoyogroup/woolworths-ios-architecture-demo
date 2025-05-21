//
//  ItemListView.swift
//  ListDash
//
//  Created by Gerald Oluoch on 15/05/25.
//

import SwiftUI

struct ItemListView: View {
    @StateObject var viewModel: ItemListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.items.enumerated()), id: \.element.name) { index, item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        HStack {
                            AsyncImage(url: URL(string: item.imageURL)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                } else if phase.error != nil {
                                    // Placeholder in case of an error
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                } else {
                                    // Placeholder while loading
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }
                            }

                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.name)
                                    .font(.headline)
                                Text(String(format: "R%.2f", item.price))
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                                Text(item.description)
                                    .font(.subheadline)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Groceries")
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {
        offsets.forEach { index in
            viewModel.deleteItem(at: index)
        }
    }
}


