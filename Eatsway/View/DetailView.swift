//
//  DetailView.swift
//  Eatsway
//
//  Created by Louise Fernando on 14/05/25.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var tenant: TenantModel
    @EnvironmentObject var filterVM: FilterViewModel

    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .topLeading){
          
            
        ScrollView {
                   VStack(spacing: 0) {
                       ZStack(alignment: .topLeading) {
                           Image(tenant.image)
                               .resizable()
                               .scaledToFill()
                               .frame(width: UIScreen.main.bounds.width, height: 400)
                               .clipped()
                           
                           LinearGradient(
                               gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                               startPoint: .bottom,
                               endPoint: .top
                           )
                           .frame(height: 400)
                           
                           VStack(alignment: .leading, spacing: 6) {
                               Text(tenant.name)
                                   .foregroundColor(.white)
                                   .font(.title)
                                   .fontWeight(.bold)
                               Text("Open hour: 11.00 - 20.00")
                                   .font(.headline)
                                   .foregroundColor(.white)
                           }
                           .padding(.top, 316)
                           .padding(.leading, 20)
                           
                           
                           NavigationLink(destination: ReviewView(tenant: tenant) .environmentObject(filterVM)) {
                               ReviewBadge(tenantRating: tenant.rating)
                                   .padding(.top, 300)
                                   .padding(.leading, 280)
                           }
                     
                           
                           // Pindahkan tombol back ke paling atas ZStack
  
                       }

                       
                       HStack {
                           Text("Menu")
                               .font(.title2)
                               .bold()
                               .padding(.top, 10)
                               .padding(.leading, 28)
                           Spacer()
                       }
                       
                       VStack(spacing: 16) {
                           ForEach(tenant.menus) { menu in
                               FoodCard(menu: menu)
                           }
                       }
                       .padding(.horizontal, 20)
                       .padding(.top, 10)
                   }
               }
               .edgesIgnoringSafeArea(.top)
               .navigationBarBackButtonHidden(true)
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.eatswayOrange)
                    .padding(15)
                    .background(Color.black.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .contentShape(Rectangle())
           }
       }
}
    
    

#Preview {
    let vm: FilterViewModel = FilterViewModel()
    let tenant = TenantModel(
        image: "Mama Djempol",
        name: "Mama Djempol",
        maxPrice: 14,
        minPrice: 4,
        tenantDescription: "Mama Djempol adalah warung makan yang menyediakan berbagai jenis masakan rumahan dengan harga yang terjangkau.",
        labels: [.noodles, .chicken, .vegetables],
        rating: 4.5,
        menus: [],
        reviews: [
            ReviewModel(
                reviewName: "Andi Santoso",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Date(),
                reviewComment: "Makanannya enak banget! Porsinya pas dan harganya terjangkau.",
                reviewRating: 4.0
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
            ),
            ReviewModel(
                reviewName: "Citra Lestari",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                reviewRating: 5.0
            ),
            ReviewModel(
                reviewName: "Citra Lestari",
                reviewType: ["food"],
                reviewImage: nil,
                reviewDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                reviewComment: "Rasa makanan otentik banget, cocok buat yang suka masakan rumahan.",
                reviewRating: 5.0
            )
        ]
    )
    DetailView(tenant: tenant)
        .environmentObject(vm)
}


