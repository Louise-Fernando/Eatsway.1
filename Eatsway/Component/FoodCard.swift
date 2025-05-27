//
//  FoodCard.swift
//  Eatsway
//
//  Created by Louise Fernando on 15/05/25.
//
import SwiftUI
import SwiftData

struct FoodCard: View {
    var menu: MenuModel
    
    var body: some View {
        HStack(spacing: 15){
            Image(menu.image)
                .resizable()
//                .scaledToFit()
                .aspectRatio(CGSize(width: 100, height: 100), contentMode: .fit)
                .frame(width: 100)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing:8) {
                Text(menu.name)
                    .font(.title3)
                    .bold()
                Text(menu.menuDescription)
                    .font(.body)
                    .lineLimit(2)
                Text("Rp. \(menu.price)k")
                    .font(.subheadline)
                    .bold()
            }
        }
        .frame(width: 350, height: 110, alignment: .leading)
//        .padding(15)

    }
}

#Preview {
    FoodCard(menu: MenuModel(
        name: "Ayam Lada Hitam", image: "Ayam Lada Hitam",
        description:
            "Oseng-oseng daging ayam dengan bumbu lada hitam",
        price: 14))
}
