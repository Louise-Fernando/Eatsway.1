//
//  ReviewView.swift
//  Eatsway
//
//  Created by Louise Fernando on 15/05/25.
//

import Foundation
import SwiftUI

struct ReviewView: View {
    var tenant: TenantModel
    @EnvironmentObject var vm: FilterViewModel
    @State private var isNavigatingToWriteView = false

    @State var averageRating: [Double] = [0.0, 0.0]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color(.gray.opacity(0.2))
                .ignoresSafeArea()
            ScrollView{
                
                VStack(spacing: 30){
                    HStack {

                        Spacer()
                    }
                    .padding(.leading, 20)
                    
                    RatingHeader(rating: vm.overallRating(from: averageRating), reviewCount: tenant.reviews.count, averageFoodRating: averageRating[0], averageServiceRating: averageRating[1])
                    // Konten review lainnya di sini
                    
                    
                }
                .padding(.top, 40)
                
                VStack{
                    ForEach(tenant.reviews) { review in
                        ReviewCard(review: review)
                            .transition(.scale) // Optional animasi sederhana
                        
                    }
                    Spacer()
                        .navigationBarBackButtonHidden(true) // Sembunyikan back button default
                        .edgesIgnoringSafeArea(.top)
                }
            }
            .padding(.bottom, 70)
            
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
            .padding(.leading, 20)
            
            VStack {
                Spacer()
                VStack(spacing: 0){
                    Divider()
                        .background(Color.gray.opacity(0.3)) // Batas abu-abu tip
                    HStack {
                        
                        NavigationLink(destination: WriteReview(tenant: tenant).environmentObject(vm)) {
                            Text("Write a Review")
                                .font(.headline)
                                .padding(.horizontal, 60)
                                .padding(.vertical, 20)
                                .background(Color.eatswayOrange, in: .capsule)
                                .foregroundStyle(.white)
                        }
                        .padding(.top, 20)
                        
                    }
                    //                .frame(width: .infinity, height: 0
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(Color.white.ignoresSafeArea(edges: .bottom))
                }
                
                
            }
            //            .padding(.top, 15)
        }
        
        .onAppear {
            let result = vm.averageRating(review: tenant.reviews)
            print("Rata-rata: \(result)")
            averageRating = result
        }


    }
    
}


#Preview {
    // Buat view model di luar closure agar tidak menggunakan @StateObject di tempat yang tidak diperbolehkan
    let vm = FilterViewModel()
    
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

    return ReviewView(tenant: tenant)
        .environmentObject(vm)
}


