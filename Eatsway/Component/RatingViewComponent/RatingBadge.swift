import SwiftUI

struct ReviewBadge: View {
    let tenantRating: Double

    var body: some View {
        VStack(spacing: 0) {
            // Top section with rating and star
            HStack(spacing: 2) {
                Text(String(format: "%.1f", tenantRating))
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
            }
            .frame(width: 100, height: 35)
            .background(Color.eatswayOrange)

            // Bottom section with "See reviews"
            Text("See reviews")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.orange)
                .frame(width: 100, height: 40)
                .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct ReviewBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewBadge(tenantRating: 4.92)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
