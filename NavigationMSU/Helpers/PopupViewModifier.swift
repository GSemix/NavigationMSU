//
//  PopupViewModifier.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 14.10.2022.
//

import Foundation
import SwiftUI

struct PopupViewModifier: ViewModifier {
    @Binding var scrollPosition: CGFloat
    @StateObject var sheetManager: SheetManager
    var someContent: AnyView
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if case let .present(config) = sheetManager.action {
                    PopupView(
                        currentHeight: $scrollPosition,
                        config: config,
                        didClose: {
                            withAnimation {
                                sheetManager.dismiss()
                            }
                        },
                        content: someContent
                    )
                }
            }
            .ignoresSafeArea()
    }
}

extension View {
    func popup(_ scrollPosition: Binding<CGFloat>, with sheetManager: SheetManager, someContent: AnyView) -> some View { // @ViewBuilder
        self.modifier(PopupViewModifier(scrollPosition: scrollPosition, sheetManager: sheetManager, someContent: someContent))
    }
}
