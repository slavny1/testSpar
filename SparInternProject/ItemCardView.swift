//
//  ItemCardView.swift
//  SparInternProject
//
//  Created by Вячеслав Горев on 17/8/2024.
//

import SwiftUI

struct ItemCardView: View {
    
    let item: ItemModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image("Product1")
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        if let label = item.label {
                            Text(label.getLabelText())
                                .font(
                                    .system(
                                        size: 10,
                                        weight: .regular,
                                        design: .default
                                    )
                                )
                                .foregroundStyle(.white)
                                .padding(.vertical, 4)
                                .padding(.leading, 12)
                                .padding(.trailing, 6)
                                .background(label.getLabelColor())
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                        Spacer()
                        HStack {
                            Image("star")
                            Text(String(item.rating))
                                .font(
                                    .system(
                                        size: 12,
                                        weight: .regular,
                                        design: .default
                                    )
                                )
                        }
                    }
                    Spacer()
                    VStack {
                        Image("receipt")
                        Image("heart")
                    }
                    .padding(8)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .frame(maxHeight: 168)
            Text(item.name)
                .font(
                    .system(
                        size: 12,
                        weight: .regular,
                        design: .default
                    )
                )
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(String(item.discountPrice ?? item.price))
                            .font(
                                .system(
                                    size: 20,
                                    weight: .bold,
                                    design: .rounded
                                )
                            )
                        Image("PerAmountIcon")
                    }
                    if (item.discountPrice != nil) {
                        Text(String(item.price))
                            .font(
                                .system(
                                    size: 12,
                                    weight: .regular,
                                    design: .default
                                )
                            )
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
                Button(action: {
                    // basket
                }, label: {
                    Image("Cart")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                })
            }
        }
        .frame(maxWidth: 168)
    }
}

#Preview {
    ItemCardView(item: ItemModel.items[0])
}
