//
//  NavigationMSUApp.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

@main
struct NavigationMSUApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var sheetManager: SheetManager = SheetManager()
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                ContentView(viewRouter: viewRouter, safeAreaTop: geometry.safeAreaInsets.top, safeAreaBottom: geometry.safeAreaInsets.bottom, viewModel: viewModel)
                    .environmentObject(sheetManager)
            }
        }
    }
}
