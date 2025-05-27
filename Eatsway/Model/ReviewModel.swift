//
//  ReviewModel.swift
//  Eatsway
//
//  Created by Louise Fernando on 16/05/25.
//

import Foundation
import SwiftData

@Model
final class ReviewModel: Identifiable{
    var reviewID: UUID = UUID()
    var reviewName: String
    var reviewType: [String]
    var reviewImage: String?
    var reviewDate: Date
    var reviewComment: String
    var reviewRating: Double
    
    
    init(reviewName: String, reviewType: [String], reviewImage: String? = nil, reviewDate: Date, reviewComment: String, reviewRating: Double) {
        self.reviewName = reviewName
        self.reviewType = reviewType
        self.reviewImage = reviewImage
        self.reviewDate = reviewDate
        self.reviewComment = reviewComment
        self.reviewRating = reviewRating
    }
}
