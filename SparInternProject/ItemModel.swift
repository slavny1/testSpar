//
//  ItemModel.swift
//  SparInternProject
//
//  Created by Вячеслав Горев on 17/8/2024.
//

import Foundation
import SwiftUI

struct ItemModel {
    
    let name: String
    let country: String?
    let priceRoubles: Int
    let priceKop: Int
    let dicount: Int?
    let discountPriceRoubles: Int?
    let discountPriceKop: Int?
    let rating: Double
    
    let countType: CountType
    
    let label: Label?
    
    enum Label {
        case novinki, udar, karta
        
        func getLabelText() -> String {
            switch self {
            case .novinki:
                return "Novinki"
            case .karta:
                return "Price with card"
            case .udar:
                return "Kick the price"
            }
        }
        
        func getLabelColor() -> Color {
            switch self {
            case .novinki:
                return Color.labelBlue90
            case .udar:
                return Color.labelRed
            case .karta:
                return Color.labelGreen90
            }
        }
    }
    
    enum CountType {
        case piece, kilo, both
    }
    
    static let items = [
        ItemModel(
            name: "Product name description",
            country: "France",
            priceRoubles: 29,
            priceKop: 99,
            dicount: 25,
            discountPriceRoubles: 23,
            discountPriceKop: 23,
            rating: 4.6,
            countType: .piece,
            label: .karta
        ),
        ItemModel(
            name: "Product next name description",
            country: nil,
            priceRoubles: 109,
            priceKop: 99,
            dicount: 5,
            discountPriceRoubles: 103,
            discountPriceKop: 33,
            rating: 4.2,
            countType: .kilo,
            label: .novinki
        )
    ]
}
