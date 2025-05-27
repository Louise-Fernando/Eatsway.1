//
//  CustomLabel.swift
//  Eatsway
//
//  Created by Louise Fernando on 13/05/25.
//

import Foundation
import SwiftUI



struct CustomLabel: View{
    var category: CuisineCategory
    var body: some View{
        Label {
            Text(category.displayText)
                .foregroundStyle(.primary)
                .font(.footnote)
                .foregroundColor(.white)
                .padding(.vertical, 7)
                .padding(.horizontal, 10)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } icon: {
        }
    }
        
}


#Preview {
    CustomLabel(category: .rice)
}

