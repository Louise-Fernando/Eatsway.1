import SwiftUI
import Foundation

struct ReviewCard: View {
    var review: ReviewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            // Header: Profile image dan name
            HStack(alignment: .top, spacing: 12) {
                if let imageName = review.reviewImage, !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 32, height: 32)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(review.reviewName)
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                
                Spacer()
            }
            
            Text(review.reviewComment)
                .font(Font.custom("Arya", size: 12))
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(review.reviewDate, style: .date)
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .padding()
        .padding(.top, 0)
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}


// Preview
#Preview {
    
        let sampleReview = ReviewModel(
            reviewName: "Louise Fernando",
            reviewType: ["food"],
            reviewImage: nil,
            reviewDate: Date(),
            reviewComment: "Makanannya enak banget dan pelayanannya juga cepat!",
            reviewRating: 4.5
        )
        
        ReviewCard(review: sampleReview)
    
}


