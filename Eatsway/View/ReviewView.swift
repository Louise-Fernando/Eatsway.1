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
    let context = DataController.previewContainer.mainContext
    let repository = TenantRepository(context: context)
    
    // Ambil tenant pertama (dummy data sudah ada)
    let tenant: TenantModel
    do {
        let tenants = try repository.getAllTenants()
        tenant = tenants.first! // force unwrap aman kalau dummy pasti ada
    } catch {
        fatalError("Failed to fetch tenant for preview: \(error)")
    }
    
    let vm = FilterViewModel(repository: repository)
    
    return ReviewView(tenant: tenant)
        .environmentObject(vm)
}

