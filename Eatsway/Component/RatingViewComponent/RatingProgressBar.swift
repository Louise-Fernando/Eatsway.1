//
//  RatingProgressBar.swift
//  Eatsway
//
//  Created by Louise Fernando on 16/05/25.
//

import Foundation
import SwiftUI


struct RatingProgressBar: View {
    var rating: Double // e.g. 3.5
    let maxRating: Double = 5.0

    var progress: Double {
        return min(rating / maxRating, 1.0)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 8)
                    .foregroundColor(Color.gray.opacity(0.3))

                RoundedRectangle(cornerRadius: 4)
                    .frame(width: geometry.size.width * progress, height: 8)
                    .foregroundColor(.eatswayOrange) // atau .orange
            }
            
        }
        .frame(width: 200,height: 8)
        
    }
}

#Preview {
    RatingProgressBar(rating: 3)
}
