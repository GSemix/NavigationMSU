//
//  SearchLineView.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

struct searchLine: View {
    let voiceSearchIcon: Image = Image("voiceSearchIcon")
    let cornerRadiusSearchLine: CGFloat = 8
    let widthBorder: CGFloat = 0.5
    let heightSearchLine: CGFloat = UIScreen.main.bounds.height*0.07
    let fontSizeText: CGFloat = UIScreen.main.bounds.width*0.041
    let horizontalPaddingSearchLine: CGFloat = UIScreen.main.bounds.width*0.05
    let heightVoiceSearchIcon: CGFloat = UIScreen.main.bounds.height*0.035
    let horizontalPaddingSearchLineContent: CGFloat = UIScreen.main.bounds.width*0.05
//    let shadowRadius: CGFloat = 2
//    let shadowOffsetY: CGFloat = 2
    
    var body: some View {
        Color.mainWhite
            .overlay(
                HStack {
                    Color.mainBlack.opacity(0.5)
                        .mask(
                            Image("searchIcon")
                                .resizable()
                                .scaledToFit()
                    )
                        .frame(width: UIScreen.main.bounds.width*0.05, height: UIScreen.main.bounds.width*0.05)
                        .padding(.trailing, UIScreen.main.bounds.width*0.035)
                    
                    Text("Поиск кабинетов")
                        .font(.none)
                        .font(.system(size: fontSizeText))
                        .foregroundColor(Color.descriptionGray)
                    
                    Spacer()
                    
                    voiceSearchIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.mainGray)
                        .frame(height: heightVoiceSearchIcon)
                }
                    .padding(.horizontal, horizontalPaddingSearchLineContent)
            )
            .frame(height: heightSearchLine)
            .cornerRadius(cornerRadiusSearchLine)
            .addBorder(Color.mainGray, width: widthBorder, cornerRadius: cornerRadiusSearchLine)
            .shadow(color: Color.mainGray, radius: 5)
//            .shadow(color: Color.mainGray, radius: shadowRadius, y: shadowOffsetY)
            .padding(.horizontal, horizontalPaddingSearchLine)
    }
}
