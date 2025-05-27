//
//  TenantRepository.swift
//  Eatsway
//
//  Created by Louise Fernando on 26/05/25.
//



import Foundation
import SwiftData

class TenantRepository {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func getAllTenants() throws -> [TenantModel] {
        try context.fetch(FetchDescriptor<TenantModel>())
    }

    func addTenant(_ tenant: TenantModel) async throws {
        context.insert(tenant)
        try context.save()
    }

    func addTenantSync(_ tenant: TenantModel) throws {
        context.insert(tenant)
        try context.save()
    }

    func updateTenant(_ tenant: TenantModel) throws {
        // SwiftData tracks changes automatically
        try context.save()
    }

    func deleteTenant(_ tenant: TenantModel) throws {
        context.delete(tenant)
        try context.save()
    }

    func addMenu(_ menu: MenuModel, to tenant: TenantModel) throws {
        tenant.menus.append(menu)
        try context.save()
    }

    func removeMenu(_ menu: MenuModel, from tenant: TenantModel) throws {
        tenant.menus.removeAll { $0.id == menu.id }
        try context.save()
    }

    func addReview(_ review: ReviewModel, to tenant: TenantModel) throws {
        tenant.reviews.append(review)
        try context.save()
    }

    func removeReview(_ review: ReviewModel, from tenant: TenantModel) throws {
        tenant.reviews.removeAll { $0.reviewID == review.reviewID }
        try context.save()
    }
}
