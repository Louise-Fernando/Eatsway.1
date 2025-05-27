//
//  TenantCard.swift
//  Eatsway
//
//  Created by Louise Fernando on 13/05/25.
//

import Foundation
import SwiftUI



struct TenantCard: View{
    // properti
    var tenant: TenantModel
    
    
    var body: some View{
        VStack(alignment: .leading, spacing: 6) {
            Image(tenant.image)
                .resizable()
                .frame(width: 170, height: 110)
                .cornerRadius(10)

            Text(tenant.name)
                .font(.title3)
                .bold()
                .padding(.top, 4)

            Text("Rp \(tenant.minPrice)k - \(tenant.maxPrice)k")
                .font(.body)
                .padding(.top, 2)

            RatingStar(rating:tenant.rating)
                .padding(.top, 2)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(Array(tenant.labels), id: \.self) { label in
                        CustomLabel(category: label)
                            .padding(.leading, 2)
                    }
                }
            }
            .padding(.top, 8)

        }
        .padding(20)
        .frame(width: 210, height: 280, alignment: .center)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 0.5)

    }
    }
    



#Preview {
    
    
    let tenant = TenantModel(
        image: "Mama Djempol",
        name: "Mama Djempol",
        maxPrice: 40,
        minPrice: 10,
        tenantDescription: "Mama Djempol adalah warung makan yang menyediakan berbagai jenis masakan rumahan dengan harga yang terjangkau.",
        labels: [.rice, .chicken, .padang],
        rating: 4.5,
        menus: [
            MenuModel(
                name: "Ayam Lada Hitam", image: "Ayam Lada Hitam",
                description: "Oseng-oseng daging ayam dengan bumbu lada hitam",
                price: 14),
            MenuModel(
                name: "Ayam Rica-Rica", image: "Ayam Rica Rica",
                description: "Olahan ayam dengan bumbu rica-rica khas manado",
                price: 11),
            MenuModel(
                name: "Mie Goreng", image: "Mie Goreng",
                description: "Mie goreng dengan bumbu lezat",
                price: 4),
            MenuModel(
                name: "Kentang Mustofa", image: "Kentang Mustofa",
                description: "Kentang kering dengan bumbu balado",
                price: 5)
        ],
        reviews: []
    )
    
    TenantCard(tenant: tenant)
}
