//
//  RatingHeader.swift
//  Eatsway
//
//  Created by Louise Fernando on 16/05/25.
//

import SwiftUI
import Foundation


struct RatingHeader: View {
    var rating: Double
    var reviewCount: Int
    var averageFoodRating: Double
    var averageServiceRating: Double
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            HStack{
                RateBadge(rating: rating, reviewCount: reviewCount)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 30){
                HStack(spacing: 20){
                    Text("Food")
                    Spacer()
                    RatingProgressBar(rating: averageFoodRating)
                    Text(String(format: "%.1f", averageFoodRating))
                }
                
                HStack(spacing: 20){
                    Text("Service")
                    Spacer()
                    RatingProgressBar(rating: averageServiceRating)
                    Text(String(format: "%.1f", averageServiceRating))
                }
            }
            .padding(.trailing)
        }
        .padding(.leading, 16)

        .frame(maxWidth: .infinity, minHeight: 200)
        .background(.white)
    }
}

#Preview {
    RatingHeader(rating: 3.75, reviewCount: 1000, averageFoodRating: 3, averageServiceRating: 3 )
}

