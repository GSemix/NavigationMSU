//
//  StylesModificatorsShapes.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.3 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    var image: Image
    var center: Bool
    var color: Color
    
    public func body(content: Content) -> some View {
        ZStack(alignment: center ? .center : .leading) {
            color
            
            if showPlaceHolder {
                HStack(spacing: 0) {
                    Color.mainBlack.opacity(0.5)
                        .mask(
                            image
                                .resizable()
                                .scaledToFit()
                    )
                        .frame(width: UIScreen.main.bounds.width*0.05, height: UIScreen.main.bounds.width*0.05)
                        .padding(.trailing, UIScreen.main.bounds.width*0.035)
                    
                    Text(placeholder)
                        .foregroundColor(Color.mainGray)
                        .font(.body)
                        .font(.system(size: UIScreen.main.bounds.width/25))
                }
                .padding(.horizontal, UIScreen.main.bounds.width*0.035)
            }
            
            content
                .foregroundColor(Color.black)
                .font(.system(size: UIScreen.main.bounds.width/20, weight: .heavy, design: .default))
                .padding(.horizontal, UIScreen.main.bounds.width*0.035)
        }
    }
}
