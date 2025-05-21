//
//  RateBadge.swift
//  Eatsway
//
//  Created by Louise Fernando on 16/05/25.
//
import SwiftUI
import Foundation


struct RateBadge: View {
    var rating: Double
    var reviewCount: Int
    var body: some View {
        
    
        VStack {
            HStack {
                HStack(spacing: 4) {
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                }
                .frame(width: 100, height: 35)
                .background(Color.eatswayOrange)
                .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                
                Text("\(reviewCount) RATED")
                    .padding(.leading, 6)
                    .font(Font.custom("Inter", size: 16))
                  .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
            }
        }

        
    }
    
    
}




#Preview {
    RateBadge(rating: 3.0, reviewCount: 10)
}
