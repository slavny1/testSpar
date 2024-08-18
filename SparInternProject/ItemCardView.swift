//
//  ItemCardView.swift
//  SparInternProject
//
//  Created by Вячеслав Горев on 17/8/2024.
//

import SwiftUI

struct ItemCardView: View {

    @State var isOrdered: Bool = false
    let item: ItemModel

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image("Product1")
                VStack {
                    HStack(alignment: .top) {
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
                                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 6, topTrailing: 6)))
                        }
                        Spacer()
                        VStack {
                            Button(action: {
                                print("tapped receipt")
                            }, label: {
                                Image("receipt")
                            })
                            .padding(.bottom, 8)
                            Button(action: {
                                print("tapped favourites")
                            }, label: {
                                Image("heart")
                            })

                        }
                        .padding(8)
                        .background(Color.white80)
                        .clipShape(RoundedRectangle(cornerRadius: 16))

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
                            .padding(.leading, -3)
                            .foregroundStyle(Color.black80)
                        Spacer()
                        if let discount = item.dicount {
                            Text(String(discount) + "%")
                                .font(
                                    .system(
                                        size: 16,
                                        weight: .bold,
                                        design: .rounded
                                    )
                                )
                                .foregroundStyle(Color.darkRed)
                        }
                    }
                    .padding(.horizontal, 4)
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
                .padding(.top, 2)
                .padding(.horizontal, 4)
                .foregroundStyle(Color.textGray80)
            if let country = item.country {
                Text(country)
                    .font(
                        .system(
                            size: 12,
                            weight: .regular,
                            design: .default
                        )
                    )
                    .foregroundStyle(Color.textGray60)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
            }
            Spacer()
            if isOrdered {
                if item.countType == .both {

                }
                HStack {
                    Button(action: {
                        print("get less")
                    }, label: {
                        Image("Minus")
                            .padding(10)
                    })
                    Spacer()
                    VStack {
                        Text("quantity")
                            .font(
                                .system(
                                    size: 16,
                                    weight: .bold,
                                    design: .rounded
                                )
                            )
                        Text("price")
                            .font(
                                .system(
                                    size: 12,
                                    weight: .regular,
                                    design: .default
                                )
                            )
                    }
                    Spacer()
                    Button(action: {
                        print("get more")
                    }, label: {
                        Image("Plus")
                            .padding(10)
                    })
                }
                .background(Color.accentColor)
                .foregroundStyle(Color.white)
                .frame(height: 36)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.horizontal, 4)
                .padding(.bottom, 4)
            } else {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(String(item.discountPriceRoubles ?? item.priceRoubles))
                                .font(
                                    .system(
                                        size: 20,
                                        weight: .bold,
                                        design: .rounded
                                    )
                                )
                                .padding(.trailing, -5)
                            Text(String(item.discountPriceKop ?? item.priceKop))
                                .font(
                                    .system(
                                        size: 16,
                                        weight: .bold,
                                        design: .rounded
                                    )
                                )
                                .padding(.trailing, -5)
                                .padding(.bottom, 2)
                            Image("PerAmountIcon")
                        }
                        .padding(.bottom, -5)
                        if (item.discountPriceRoubles != nil) {
                            Text(String(item.priceRoubles) + "," + String(item.priceKop))
                                .font(
                                    .system(
                                        size: 12,
                                        weight: .regular,
                                        design: .default
                                    )
                                )
                                .foregroundStyle(Color.textGray60)
                                .strikethrough()
                        }
                    }
                    Spacer()
                    Button(action: {
                        isOrdered.toggle()
                    }, label: {
                        Image("Cart")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(Color.accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    })
                }
                .padding(.horizontal, 4)
                .padding(.bottom, 4)
            }
        }
        .frame(width: 168, height: 278)
    }
}

#Preview {
    ItemCardView(item: ItemModel.items[0])
}
