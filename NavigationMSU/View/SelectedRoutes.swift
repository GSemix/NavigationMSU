//
//  SelectedRoutes.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 01.09.2022.
//

import SwiftUI

struct SelectedRoutesButton: View {
    @Binding var isPopup: Bool
    
    var body: some View {
        Button(action: {
            self.isPopup = true
        }) {
            Image("starIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.mainGray)
                .frame(width: UIScreen.main.bounds.width*0.07, height: UIScreen.main.bounds.width*0.07)
                .font(.headline)
                .padding(UIScreen.main.bounds.width*0.045)
                .background(Color.white)
                .cornerRadius(7)
                .clipped()
        }
        .buttonStyle(GrowingButton())
        .shadow(color: Color.mainGray, radius: 5)
        .padding(.top, UIScreen.main.bounds.height*0.025)
        .padding(.trailing, UIScreen.main.bounds.width*0.05)
    }
}
