//
//  LoaderView.swift
//  3DMap
//
//  Created by Семен Безгин on 05.08.2022.
//

import SwiftUI

struct LoaderView: View {
    @State var isSpinCircle = false
    
    var body: some View {
        Circle()
            .trim(from: 0.5, to: 1)
            .stroke(Color.mainPurple, lineWidth: 5)
            .frame(width: UIScreen.main.bounds.width / 7, height: UIScreen.main.bounds.width / 7, alignment: .center)
            .rotationEffect(.degrees(isSpinCircle ? 0 : -360), anchor: .center)
            .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false), value: true)
            .onAppear {
                self.isSpinCircle = true
            }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
