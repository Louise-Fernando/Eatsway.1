//
//  DataController.swift
//  Eatsway
//
//  Created by Louise Fernando on 27/05/25.
//

import Foundation
import SwiftData

@MainActor
class DataController {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: TenantModel.self, configurations: config)

            // Tambahkan context dari container
            let context = container.mainContext
            
            // Tambahkan data dummy untuk preview
            let dummyTenants = TenantSeeder.generateTenantModel()
            for tenant in dummyTenants {
                context.insert(tenant)
            }
            
            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
