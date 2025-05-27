//
//  EatswayApp.swift
//  Eatsway
//
//  Created by Louise Fernando on 09/05/25.
//

// EatswayApp.swift
import SwiftUI
import SwiftData

@main
struct EatswayApp: App {
    let sharedModelContainer: ModelContainer
    let repository: TenantRepository
    let filterVM: FilterViewModel
    
    init() {
        do {
            let schema = Schema([TenantModel.self])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.sharedModelContainer = container

            let context = container.mainContext
            self.repository = TenantRepository(context: context)
            self.filterVM = FilterViewModel(repository: self.repository)

        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }


    var body: some Scene {
        WindowGroup {
            RecommendationView()
                .onAppear {
                    Task {
                        await seedInitialDataIfNeeded(context: sharedModelContainer.mainContext)
                    }
                }
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(filterVM)
    }

    func seedInitialDataIfNeeded(context: ModelContext) async {
        let repository = TenantRepository(context: context)
        let dataSeeder = DataSeeder(tenantRepository: repository)
        await dataSeeder.seedInitialDataIfNeeded()
    }
}
