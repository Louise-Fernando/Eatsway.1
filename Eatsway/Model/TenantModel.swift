//
//  tenantModel.swift
//  Eatsway
//
//  Created by Louise Fernando on 09/05/25.
//

import Foundation
import SwiftData

enum CuisineCategory: String, CaseIterable, Codable {
    case rice
    case noodles
    case porridge
    case snacks
    case bakso
    case soto
    case beverages
    case chicken
    case padang
    case vegetables

    var displayText: String {
        switch self {
        case .rice: return "Rice"
        case .noodles: return "Noodles"
        case .porridge: return "Porridge"
        case .snacks: return "Snacks"
        case .bakso: return "Bakso"
        case .soto: return "Soto"
        case .beverages: return "Beverages"
        case .chicken: return "Chicken"
        case .padang: return "Padang"
        case .vegetables: return "Vegetables"
        }
    }
}

@Model
final class TenantModel: Identifiable, Hashable{
    var tenantID: UUID = UUID()
    var image: String
    var name: String
    var maxPrice: Int  //in thousand
    var minPrice: Int  //in thousand
    var tenantDescription: String
    var labels: Set<CuisineCategory>
    var rating: Double
    @Relationship(deleteRule: .cascade)
    var menus: [MenuModel]
    @Relationship(deleteRule: .cascade)
    var reviews: [ReviewModel]
    

    
    init(image: String, name: String, maxPrice: Int, minPrice: Int, tenantDescription: String, labels: Set<CuisineCategory>, rating: Double, menus: [MenuModel], reviews: [ReviewModel]) {
        self.image = image
        self.name = name
        self.maxPrice = maxPrice
        self.minPrice = minPrice
        self.tenantDescription = tenantDescription
        self.labels = labels
        self.rating = rating
        self.menus = menus
        self.reviews = reviews
    }
    
    
    
    
}
