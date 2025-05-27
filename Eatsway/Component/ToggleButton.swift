//
//  Untitled.swift
//  Eatsway
//
//  Created by Louise Fernando on 09/05/25.
//
import SwiftUI
import Foundation

struct ToggleButton: View{
    let buttonText: String
    let isSelected: Bool
    let action:()->Void
    
    var body: some View{
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            Text(buttonText)
                .font(.system(size: 14))
                .padding(10)
                .foregroundColor(isSelected ? .white : Color.eatswayOrange)
                .background(isSelected ? Color.eatswayOrange : Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.eatswayOrange, lineWidth: 2)
                )
                .cornerRadius(10)
        }
    }
}

#Preview {
    ToggleButton(buttonText: "nasi", isSelected: false, action: {print("Button tapped")})
}
