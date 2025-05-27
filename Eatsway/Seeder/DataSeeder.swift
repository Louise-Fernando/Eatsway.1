//
//  DataSeeder.swift
//  Eatsway
//
//  Created by Louise Fernando on 26/05/25.
//

//
//  DataSeeder.swift
//  Eatsway
//
//  Created by Louise Fernando on 26/05/25.
//

import Foundation
import SwiftData

class DataSeeder {
    let tenantRepository: TenantRepository

    init(tenantRepository: TenantRepository) {
        self.tenantRepository = tenantRepository
    }

    @MainActor
    func seedInitialDataIfNeeded() async {
        do {
            let existingTenants = try tenantRepository.getAllTenants()
            
            if existingTenants.isEmpty {
                let tenantsToSeed = TenantSeeder.generateTenantModel()
                for tenant in tenantsToSeed {
                    try await tenantRepository.addTenant(tenant)
                }
                print("Initial data seeded successfully via DataSeeder.")
            } else {
                print("Database already has data, skipping seeding via DataSeeder.")
            }
        } catch {
            print("Error seeding initial data via DataSeeder: \(error)")
        }
    }
    
 



}

