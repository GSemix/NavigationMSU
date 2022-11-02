//
//  Floors.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 17.10.2022.
//

import SwiftUI

struct floors: View {
    var floorNumber: String = "1"
    let fontSizeText: CGFloat = UIScreen.main.bounds.width*0.05
    
    var body: some View {
        Button(action: {}) {
            Text(floorNumber + " этаж")
                .bold()
                .font(.system(size: fontSizeText))
                .foregroundColor(Color.mainPurple)
                .padding(20)
                .background(Color.white.cornerRadius(7).opacity(0.99))
//                .clipped()
        }
        .padding(.leading, 10)
        .buttonStyle(GrowingButton())
    }
}
