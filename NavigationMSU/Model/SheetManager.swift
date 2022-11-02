//
//  SheetManager.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 14.10.2022.
//

import Foundation
import SwiftUI

final class SheetManager: ObservableObject {
    typealias Config = Action.Info
    typealias Scrolling = Action.Info.ScrollConfig
    
    enum Action {
        struct Info {
            let systemName: String
            var title: String
            let content: String
            
            let minHeight: CGFloat
            let mainHeight: CGFloat
            let maxHeight: CGFloat
            let backgroundColor: Color
            let scrolling: Scrolling
            let tapToGrow: Bool
            
            struct ScrollConfig {
                let isScrollable: Bool
                let time: Int
                let slowdownCoeff: Double
                let delay: Int
                
                init(isScrollable: Bool, time: Int, slowdownCoeff: Double, delay: Int) {
                    self.isScrollable = isScrollable
                    self.time = time
                    self.slowdownCoeff = slowdownCoeff
                    self.delay = delay
                }
                
                init(isScrollable: Bool) {
                    self.isScrollable = isScrollable
                    
                    if isScrollable {
                        self.time = 150
                        self.slowdownCoeff = 0.0000015
                        self.delay = 3
                    } else {
                        self.time = 0
                        self.slowdownCoeff = 0.0
                        self.delay = 0
                    }
                }
            }
            
        }
        
        case na
        case present(info: Info)
        case scrolling
        case dismiss
    }
    
    @Published private(set) var action: Action = .na
    
    func present(with config: Config) {
//        guard !action.isPresented else { return }
//        self.action = .present(info: config)
        
        guard action.isPresented else { self.action = .present(info: config); print("started"); return }
        withAnimation {
            self.dismiss()
        }
        print("updated")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                self.action = .present(info: config)
            }
        }
    }
    
    func dismiss() {
        self.action = .dismiss
    }
    
    func scrolling() {
        guard action.isPresented else { return }
        self.action = .scrolling
    }
}

extension SheetManager.Action {
    var isPresented: Bool {
        guard case .present(_) = self else { return false }
        return true
    }
}
