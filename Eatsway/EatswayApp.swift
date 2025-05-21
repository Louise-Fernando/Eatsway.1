//
//  EatswayApp.swift
//  Eatsway
//
//  Created by Louise Fernando on 09/05/25.
//

import SwiftUI
import SwiftData

@main
struct EatswayApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
    
    @StateObject var filterVM = FilterViewModel()

    var body: some Scene {
        WindowGroup {
            RecommendationView()
        }.environmentObject(filterVM)
      
//        .modelContainer(sharedModelContainer)
    }
}
