//
//  MenuModel.swift
//  Eatsway
//
//  Created by Louise Fernando on 15/05/25.
//

import Foundation
import SwiftData

@Model
final class MenuModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var image: String
    var menuDescription: String
    var price: Int
    
    
    init(name: String, image: String, description: String, price: Int) {
        self.name = name
        self.image = image
        self.menuDescription = description
        self.price = price
    }
}
