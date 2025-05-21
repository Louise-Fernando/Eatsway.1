//
//  RatingStar.swift
//  Eatsway
//
//  Created by Louise Fernando on 15/05/25.

import Foundation
import SwiftUI

struct RatingStar: View {
    let rating: Double
    let maxRating: Int = 5

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<maxRating, id: \.self) { index in
                let starValue = rating - Double(index)
                PartialStar(fill: max(0, min(1, starValue)))
                    .frame(width: 16, height: 16)
            }
        }
    }
}

struct PartialStar: View {
    let fill: Double // 0.0 to 1.0

    var body: some View {
        ZStack {
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.yellow)

            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.yellow)
                .mask(
                    GeometryReader { geometry in
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(fill))
                            .alignmentGuide(.leading) { _ in 0 }
                    }
                )
        }
    }
}



#Preview{
    RatingStar(rating: 4.50)
}

