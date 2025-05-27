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
    
    return DetailView(tenant: tenant)
        .environmentObject(vm)
}



