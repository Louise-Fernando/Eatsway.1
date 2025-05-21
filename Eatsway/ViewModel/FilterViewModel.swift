//
//  FilterViewModel.swift
//  Eatsway
//
//  Created by Louise Fernando on 14/05/25.
//

import SwiftUI
import Foundation


enum PriceSortingOption: String,CaseIterable, Codable{
    case lowToHigh
    case highToLow
    case none
    
    var displayText: String{
        switch self{
        case .lowToHigh: return "Low to High"
        case .highToLow: return "High to Low"
        case .none: return ""
        }
    }
}


// FilterViewModel+Seeder.swift
extension FilterViewModel {
    func generateTenantModel() -> [TenantModel] {
        return [
            TenantModel(
                image: "Mama Djempol",
                name: "Mama Djempol",
                maxPrice: 14,
                minPrice: 4,
                tenantDescription: "Mama Djempol adalah warung makan yang menyediakan berbagai jenis masakan rumahan dengan harga yang terjangkau.",
                labels: [.noodles, .chicken, .vegetables],
                rating: 1,
                menus: [
                    MenuModel(
                        name: "Ayam Lada Hitam", image: "Ayam Lada Hitam",
                        description:
                            "Oseng-oseng daging ayam dengan bumbu lada hitam",
                        price: 14),

                    MenuModel(
                        name: "Ayam Rica-Rica", image: "Ayam Rica Rica",
                        description:
                            "Olahan ayam dengan bumbu rica-rica khas manado",
                        price: 11),

                    MenuModel(
                        name: "Mie Goreng", image: "Mie Goreng",
                        description: "Mie goreng dengan bumbu lezat", price: 4),

                    MenuModel(
                        name: "Kentang Mustofa", image: "Kentang Mustofa",
                        description: "Kentang kering dengan bumbu balado", price: 5)

                ],
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
                    ),
                    ReviewModel(
                        reviewName: "Budi Hartono",
                        reviewType: ["service"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                        reviewComment: "Lumayan enak tapi nunggu makanannya agak lama.",
                        reviewRating: 3.0
                    ),
                    ReviewModel(
                        reviewName: "Citra Lestari",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                        reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                        reviewRating: 5.0
                    )]
            ),
            TenantModel(
                image: "Mustafa Minang",
                name: "Mustafa Minang",
                maxPrice: 33,
                minPrice: 15,
                tenantDescription: "Mustafa Minang adalah rumah makan yang menjual berbagai masakan dari Sumatera Barat",
                labels: [.chicken, .rice, .padang],
                rating: 2.5,
                menus: [
                    MenuModel(
                        name: "Nasi + Telor", image: "Nasi Telur",
                        description:
                            "Nasi putih dengan lauk telur dadar dan tambahan sayuran",
                        price: 15),

                    MenuModel(
                        name: "Nasi + Ayam Bakar", image: "Nasi Ayam Bakar",
                        description:
                            "Nasi putih dengan lauk ayam bakar dan tambahan sayuran",
                        price: 22),
                    MenuModel(
                        name: "Nasi + Rendang", image: "Nasi Rendang",
                        description:
                            "Nasi putih dengan lauk rendang dan tambahan sayuran",
                        price: 25),
                    MenuModel(
                        name: "Nasi + Gulai Tunjang", image: "Nasi Gulai Tunjang",
                        description:
                            "Nasi putih dengan lauk gulai tunjang dan tambahan sayuran",
                        price: 33)
                ],
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
                    ),
                    ReviewModel(
                        reviewName: "Budi Hartono",
                        reviewType: ["service"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                        reviewComment: "Lumayan enak tapi nunggu makanannya agak lama.",
                        reviewRating: 3.0
                    ),
                    ReviewModel(
                        reviewName: "Citra Lestari",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                        reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                        reviewRating: 5.0
                    )]
            ),
            TenantModel(
                image: "Bakso Joss",
                name: "Bakso Joss",
                maxPrice: 25,
                minPrice: 15,
                tenantDescription: "Bakso Joss merupakan rumah makan yang menjual berbagai olahan bakso",
                labels: [.bakso],
                rating: 3.75,
                menus: [
                    MenuModel(
                        name: "Bakso Polos", image: "Bakso Polos",
                        description: "Bakso polos dengan kuah kaldu yang gurih",
                        price: 22),
                    MenuModel(
                        name: "Bakso Malang", image: "Bakso Malang",
                        description:
                            "Bakso malang dengan kuah kaldu yang gurih dan pangsit renyah",
                        price: 15),
                    MenuModel(
                        name: "Bakso Telur", image: "Bakso Telur",
                        description:
                            "Bakso isi telur dengan kuah kaldu yang gurih dan pangsit renyah",
                        price: 22),
                    MenuModel(
                        name: "Bakso Besar", image: "Bakso Besar",
                        description:
                            "Bakso dengan ukuran jumbo dengan kuah kaldu yang gurih",
                        price: 25)

                ],
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
                    ),
                    ReviewModel(
                        reviewName: "Budi Hartono",
                        reviewType: ["service"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                        reviewComment: "Lumayan enak tapi nunggu makanannya agak lama.",
                        reviewRating: 3.0
                    ),
                    ReviewModel(
                        reviewName: "Citra Lestari",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                        reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                        reviewRating: 5.0
                    )]
            ),
            TenantModel(
                image: "Warung Gado Gado",
                name: "Warung Gado Gado",
                maxPrice: 25,
                minPrice: 17,
                tenantDescription: "Menjual gado-gado dan ketoprak",
                labels: [.vegetables, .rice],
                rating: 4.8,
                menus: [
                    MenuModel(name: "Gado-gado", image: "Gado Gado", description: "Gado gado standard tanpa lontong", price: 17),
                    MenuModel(name: "Gado-gado Telur", image: "Gado Gado Telur", description: "Gado gado dengan telur tanpa lontong", price: 20),
                    MenuModel(name: "Gado-gado Lontong", image: "Gado Gado Lontong", description: "Gado gado standard dengan lontong", price: 22),
                ]
                ,
                reviews: [
                    ReviewModel(
                        reviewName: "Andi Santoso",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Date(),
                        reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                        reviewRating: 4.5
                    ),
                    ReviewModel(
                        reviewName: "Budi Hartono",
                        reviewType: ["service"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                        reviewComment: "Lumayan enak tapi nunggu makanannya agak lama.",
                        reviewRating: 3.0
                    ),
                    ReviewModel(
                        reviewName: "Citra Lestari",
                        reviewType: ["food"],
                        reviewImage: nil,
                        reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                        reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                        reviewRating: 5.0
                    )]
               
            )
        ]
    }
    
}

class FilterViewModel: ObservableObject{
    @Published var tenants: [TenantModel] = []
    // Menyimpan status filter
    @Published var selectedCuisines: Set<CuisineCategory> = [] // Memilih beberapa kategori makanan
    @Published var priceSorting: PriceSortingOption = .none// Menyimpan opsi pengurutan harga
    @Published var filteredTenants: [TenantModel] = [] // Daftar tenant yang terfilter
    @Published var topFiltered: [TenantModel] = []
    
        init(){
            self.tenants = generateTenantModel()
            applyFilters()
        }

    func applyFilters() {
        print("== APPLYING FILTERS ==")
        print("Selected Cuisines: \(selectedCuisines)")
        
        for tenant in tenants {
            print("Tenant: \(tenant.name), Labels: \(tenant.labels)")
        }
        
        if selectedCuisines.isEmpty && priceSorting == .none {
            print("No filters selected, showing all tenants.")
            self.filteredTenants = tenants
            self.topFiltered = tenants
                .filter { $0.rating > 4 }
                .sorted { $0.rating > $1.rating }
            return
        }
        
        var tenantsToFilter = tenants
        
        // Filter berdasarkan selectedCuisines
        if !selectedCuisines.isEmpty {
            tenantsToFilter = tenantsToFilter.filter { tenant in
                let tenantLabelSet = Set(tenant.labels)
                let hasCommonCuisine = !selectedCuisines.isDisjoint(with: tenantLabelSet)
                print("Checking \(tenant.name): \(hasCommonCuisine ? "✅ Match" : "❌ No match")")
                return hasCommonCuisine
            }
        }
        
        // Sorting by price
        switch priceSorting {
        case .lowToHigh:
            tenantsToFilter.sort { $0.minPrice < $1.minPrice }
        case .highToLow:
            tenantsToFilter.sort { $0.maxPrice > $1.maxPrice }
        case .none:
            break
        }
           
        // Filter dan sort top rating dari tenantsToFilter, bukan tenants asli
        let topFilter = tenantsToFilter.filter { $0.rating > 4 }
        self.topFiltered = topFilter.sorted { $0.rating > $1.rating }

        print("Filtered Tenants: \(tenantsToFilter.map { $0.name })")
        
        self.filteredTenants = tenantsToFilter
    }

    
    
    
    func resetFilters() {
        selectedCuisines.removeAll()
        priceSorting = .none
    }
    func generateCuisines() -> [[CuisineCategory]] {
        return [
            [.rice, .noodles, .porridge, .snacks,
             .bakso, .soto, .beverages,
             .chicken, .padang, .vegetables]
        ]
    }
    
    // generate dummy tenantModel seeder
    
    
    // jika cuisine selected, maka akan dimasukkan ke list selected cuisine yang akan digunakan untuk filter nanti
    func isCuisineSelected (_ Cuisine: CuisineCategory )->Bool{
        return selectedCuisines.contains(Cuisine)
    }
    
    func toggleCuisine(_ Cuisine: CuisineCategory){
        if selectedCuisines.contains(Cuisine){
            selectedCuisines.remove(Cuisine)
        }else{
            selectedCuisines.insert(Cuisine)
        }
    }
    
    // filter untuk type sorting
    func selectSort (_ sort: PriceSortingOption)->Bool{
        return priceSorting == sort
    }
    
    func getChunkedCuisines(into size: Int = 3) -> [[CuisineCategory]] {
        let allCuisines = generateCuisines().flatMap { $0 }
        return allCuisines.chunked(into: size)
    }
    
    
    func togglePriceSorting(_ option: PriceSortingOption){
        priceSorting = (priceSorting == option) ? .none : option
        print("Checking \(priceSorting.displayText)")
        
    }
    
    // REVIEW
    func addReview(to tenantID: UUID, newReview: ReviewModel) {
        if let index = tenants.firstIndex(where: { $0.tenantID == tenantID }) {
            let tenant = tenants[index]
            tenant.reviews.append(newReview)
            tenants[index] = tenant
        }
    }

    func averageRating(review: [ReviewModel]) -> [Double] {
        var foodTotal = 0.0
        var foodCount = 0
        var serviceTotal = 0.0
        var serviceCount = 0

        for r in review {
            if r.reviewType.contains("food") {
                foodTotal += r.reviewRating
                foodCount += 1
            }
            if r.reviewType.contains("service") {
                serviceTotal += r.reviewRating
                serviceCount += 1
            }
        }

        let foodAvg = foodCount == 0 ? 0.0 : foodTotal / Double(foodCount)
        let serviceAvg = serviceCount == 0 ? 0.0 : serviceTotal / Double(serviceCount)

        return [foodAvg, serviceAvg]
    }
    
    func overallRating(from averages: [Double]) -> Double {
        guard averages.count == 2 else { return 0.0 }
        return (averages[0] + averages[1]) / 2.0
    }

    
}
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}


