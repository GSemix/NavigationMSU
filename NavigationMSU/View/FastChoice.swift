//
//  FastChoice.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

struct fastChoice: View {
    let Elements: [String] = ["Заведующий", "Декан", "Кафедра", "Заместитель", "Деканат"]
    
    let heightScrollView: CGFloat = UIScreen.main.bounds.height*0.1
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Elements, id: \.self) { elem in
                    FCElem(text: elem)
                }
            }
        }
        .frame(height: heightScrollView)
    }
}

struct FCElem: View {
    let text: String
    let fontSizeText: CGFloat = UIScreen.main.bounds.width*0.045
    
    var body: some View {
        Button(action: {}) {
            Text(text)
                .bold()
                .font(.system(size: fontSizeText))
                .foregroundColor(Color.mainBlack)
                .padding(10)
                .background(Color.white.cornerRadius(5).opacity(0.99))
//                .clipped()
        }
        .padding(.horizontal, 10)
        .buttonStyle(GrowingButton())
    }
}
