//
//  ItemCardView.swift
//  SparInternProject
//
//  Created by Вячеслав Горев on 17/8/2024.
//

import SwiftUI

struct ItemCardView: View {

    @State var isOrdered: Bool = false
    @State var quantityKilo: Double = 0
    @State var quantityPieces: Int = 0
    @State var quantityType: ItemModel.CountType = .piece
    @State var pricePerKilo: Double = 0
    @State var pricePerPieces: Double = 0

    @State var isFavourite = false

    let isGridViewStyle: Bool
    let item: ItemModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
            VStack(alignment: .leading) {
                ZStack {
                    Image("Product1")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 168)
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
                                    isFavourite.toggle()
                                }, label: {
                                    Image(isFavourite ? "HeartFilled" : "heart")
                                })

                            }
                            .padding(8)
                            .background(Color.white80)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.top, 4)
                            .padding(.trailing, 4)
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
                        .padding(.horizontal, 8)
                    }
                }
                descriptionAndCountry
                Spacer()
                if isOrdered {
                    Picker("", selection: $quantityType) {
                        Text("Шт").tag(ItemModel.CountType.piece)
                        Text("Кг").tag(ItemModel.CountType.kilo)
                    }
                    .pickerStyle(.segmented)
                    .frame(height: 28)
                    .padding(.horizontal, 8)
                    quantityButton
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                } else {
                    priceAndButton
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                }
            }
        }
        .onAppear {
            quantityType = item.countType
        }
        .onChange(of: quantityKilo) { oldValue, newValue in
            pricePerKilo = quantityKilo * Double(item.discountPriceRoubles ?? item.priceRoubles) + quantityKilo * Double(item.discountPriceKop ?? item.priceKop)
        }

    }

    var descriptionAndCountry: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(
                    .system(
                        size: 12,
                        weight: .regular,
                        design: .default
                    )
                )
                .foregroundStyle(Color.textGray80)
            if let country = item.country, !isOrdered {
                Text(country)
                    .font(
                        .system(
                            size: 12,
                            weight: .regular,
                            design: .default
                        )
                    )
                    .foregroundStyle(Color.textGray60)
                    .padding(.top, 1)
            }
        }
        .padding(.horizontal, 8)
    }

    var quantityButton: some View {
        HStack {
            Button(action: {
                if quantityType == .kilo {
                    quantityKilo -= 0.1
                    if quantityKilo <= 0 {
                        isOrdered.toggle()
                        quantityPieces = 0
                    }
                } else {
                    quantityPieces -= 1
                    if quantityPieces <= 0 {
                        isOrdered.toggle()
                        quantityKilo = 0
                    }
                }
            }, label: {
                Image("Minus")
                    .padding(10)
            })
            Spacer()
            VStack {
                Text(quantityType == .piece ? String(quantityPieces) : String(format: "%0.1f", quantityKilo))
                    .font(
                        .system(
                            size: 16,
                            weight: .bold,
                            design: .rounded
                        )
                    )
                Text(quantityType == .piece ? String(format: "%0.2f", pricePerPieces) : String(format: "%0.2f", pricePerKilo))
                    .font(
                        .system(
                            size: 12,
                            weight: .regular,
                            design: .default
                        )
                    )
                    .foregroundStyle(Color.white80)
            }
            Spacer()
            Button(action: {
                if quantityType == .kilo {
                    quantityKilo += 0.1
                } else {
                    quantityPieces += 1
                }
            }, label: {
                Image("Plus")
                    .padding(10)
            })
        }
        .background(Color.accentColor)
        .foregroundStyle(Color.white)
        .frame(height: 36)
        .clipShape(RoundedRectangle(cornerRadius: 40))
    }

    var priceAndButton: some View {
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
                    quantityKilo += 0.1
                    quantityPieces += 1
            }, label: {
                Image("Cart")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
            })
        }
    }
}

#Preview {
    ItemCardView(isGridViewStyle: true, item: ItemModel.items[0])
            .frame(width: 168, height: 278)
            .clipShape(
                RoundedRectangle(cornerRadius: 20)
            )
            .shadow(radius: 10)
            .frame(maxHeight: 278)
}

