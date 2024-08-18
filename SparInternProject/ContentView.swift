//
//  ContentView.swift
//  SparInternProject
//
//  Created by Вячеслав Горев on 17/8/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 8) {
            ForEach(ItemModel.items, id: \.name) { item in
                ZStack {
                    ItemCardView(item: item)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.clear)
                        .shadow(color:.black, radius: 20, x: 5, y: 5)
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
