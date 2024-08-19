//
//  ContentView.swift
//  SparInternProject
//
//  Created by Вячеслав Горев on 17/8/2024.
//

import SwiftUI

struct ContentView: View {

    @State var isGridViewStyle: Bool = true

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: isGridViewStyle ? [GridItem(), GridItem()] : [GridItem()],
                spacing: 8
            ) {
                ForEach(ItemModel.items, id: \.name) { item in
                    if !isGridViewStyle {
                        Rectangle()
                            .foregroundStyle(Color("DividerGray"))
                            .frame(width: 500, height: 1)
                            .padding(.vertical, 8)
                    }
                    ItemCardView(isGridViewStyle: isGridViewStyle, item: item)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .shadow(radius: isGridViewStyle ? 10 : 0)
                        .frame(height: isGridViewStyle ? 278 : 144)

                }
            }
            .padding(.horizontal)
            .padding(.vertical, isGridViewStyle ? 8 : 0)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    isGridViewStyle.toggle()
                }, label: {
                    Image(isGridViewStyle ? "iconGrid" : "iconList")
                        .padding(12)
                        .background(Color.backLightGray)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                })
            }
        })
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
