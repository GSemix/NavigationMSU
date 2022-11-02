//
//  Extensions.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

extension Color {
    static let mainBlue = Color(red: 53 / 255, green: 116 / 255, blue: 238 / 255)
    static let mainWhite = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let mainBlack = Color(red: 5 / 255, green: 5 / 255, blue: 7 / 255)
    static let mainGray = Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
    static let mainPurple = Color(red: 117 / 255, green: 0 / 255, blue: 175 / 255)
    static let descriptionGray = Color(red: 118 / 255, green: 118 / 255, blue: 121 / 255)
    static let backgroundMap = Color(red: 239 / 255, green: 237 / 255, blue: 241 / 255)
}

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
            let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        
            return clipShape(roundedRect)
                .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}
