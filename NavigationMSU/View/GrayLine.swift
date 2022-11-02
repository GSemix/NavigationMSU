//
//  GrayLine.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

struct GrayLine: View {
    var width: CGFloat?
    
    var body: some View {
        Rectangle()
            .frame(width: self.width, height: 1)
            .foregroundColor(Color.mainGray)
            .opacity(0.4)
        
    }
}
