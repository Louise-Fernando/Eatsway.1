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


class FilterViewModel: ObservableObject {
    private let repository: TenantRepository

    @Published var tenants: [TenantModel] = []
    @Published var selectedCuisines: Set<CuisineCategory> = []
    @Published var priceSorting: PriceSortingOption = .none
    @Published var filteredTenants: [TenantModel] = []
    @Published var topFiltered: [TenantModel] = []

    init(repository: TenantRepository) {
        self.repository = repository
        loadTenants() // Ubah nama fungsi untuk kejelasan
    }

    private func loadTenants() {
        do {
            tenants = try repository.getAllTenants()
            applyFilters() // Terapkan filter setelah data dimuat
        } catch {
            print("Error loading tenants: \(error)")
            tenants = []
            filteredTenants = []
            topFiltered = []
        }
    }

    func applyFilters() {
        print("== APPLYING FILTERS ==")
        print("Selected Cuisines: \(selectedCuisines)")

        for tenant in tenants {
            print("Tenant: \(tenant.name), Labels: \(tenant.labels)")
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

        // Filter dan sort top rating dari tenantsToFilter
        let topFilter = tenantsToFilter.filter { $0.rating > 4 }
        self.topFiltered = topFilter.sorted { $0.rating > $1.rating }

        print("Filtered Tenants: \(tenantsToFilter.map { $0.name })")

        self.filteredTenants = tenantsToFilter
    }

    func resetFilters() {
        selectedCuisines.removeAll()
        priceSorting = .none
        applyFilters() // Terapkan filter setelah reset
    }

    func generateCuisines() -> [[CuisineCategory]] {
        return [
            [.rice, .noodles, .porridge, .snacks,
             .bakso, .soto, .beverages,
             .chicken, .padang, .vegetables]
        ]
    }

    func isCuisineSelected (_ Cuisine: CuisineCategory ) -> Bool {
        return selectedCuisines.contains(Cuisine)
    }

    func toggleCuisine(_ Cuisine: CuisineCategory) {
        if selectedCuisines.contains(Cuisine) {
            selectedCuisines.remove(Cuisine)
        } else {
            selectedCuisines.insert(Cuisine)
        }
        applyFilters() // Terapkan filter setiap kali pilihan berubah
    }

    func selectSort (_ sort: PriceSortingOption) -> Bool {
        return priceSorting == sort
    }

    func getChunkedCuisines(into size: Int = 3) -> [[CuisineCategory]] {
        let allCuisines = generateCuisines().flatMap { $0 }
        return allCuisines.chunked(into: size)
    }

    func togglePriceSorting(_ option: PriceSortingOption) {
        priceSorting = (priceSorting == option) ? .none : option
        print("Checking \(priceSorting.displayText)")
        applyFilters() // Terapkan filter setiap kali sorting berubah
    }

    // REVIEW FUNCTIONS (tetap sama)
    func addReview(to tenantID: UUID, newReview: ReviewModel) {
        if let index = tenants.firstIndex(where: { $0.tenantID == tenantID }) {
            let tenant = tenants[index]
            tenant.reviews.append(newReview)
            // Anda mungkin perlu memanggil repository.updateTenant(tenant) di sini
            // untuk menyimpan perubahan ke database jika Anda ingin review persisten.
            tenants[index] = tenant
            applyFilters() // Perbarui tampilan setelah menambah review? (opsional)
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
