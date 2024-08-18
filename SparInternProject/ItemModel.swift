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
    let price: Double
    let dicount: Int?
    let discountPrice: Double?
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
            return .green
        }
    }
    
    enum CountType {
        case piece, kilo, both
    }
    
    static let items = [
        ItemModel(
            name: "Product name description",
            country: "France",
            price: 29.99,
            dicount: 25,
            discountPrice: 23.33,
            rating: 4.6,
            countType: .piece,
            label: .karta
        ),
        ItemModel(
            name: "Product next name description",
            country: nil,
            price: 109.99,
            dicount: 5,
            discountPrice: 103.33,
            rating: 4.2,
            countType: .kilo,
            label: .novinki
        )
    ]
}
