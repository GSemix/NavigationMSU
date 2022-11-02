//
//  TabBarView.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

struct tabBarIcons: View {
    @StateObject var viewRouter: ViewRouter
    var showTabBar: [Page] = [.menu, .main, .search, .floor]
    
    let horizontalPaddingIcon: CGFloat = UIScreen.main.bounds.width*0.1
    let heightTabBar: CGFloat = UIScreen.main.bounds.height*0.1
    let horizontalPaddingTabBar: CGFloat = UIScreen.main.bounds.width*0.035
    let cornerRadiusTabBar: CGFloat = 16
    let spacingVerticalIcons: CGFloat = .zero
    
    var body: some View {
        if showTabBar.contains(viewRouter.currentPage) {
            VStack {
                VStack(spacing: spacingVerticalIcons) {
                    Color.mainPurple
                        .overlay(content: {
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Icon(viewRouter: viewRouter, assignedPage: .floor, iconImage: Image("floorIcon"), tabName: "Этаж")
                                    
                                    Spacer()
                                    
                                    Icon(viewRouter: viewRouter, assignedPage: .route, iconImage: Image("searchIcon"), tabName: "Маршрут")
                                    
                                    Spacer()
                                    
                                    Icon(viewRouter: viewRouter, assignedPage: .start, iconImage: Image("menuIcon"), tabName: "Меню")
                                }
                                .padding(.horizontal, horizontalPaddingIcon)
                                .padding(.vertical)
                                
                                Spacer()
                            }
                        })
                        .frame(height: heightTabBar)
                        .cornerRadius(cornerRadiusTabBar)
                        .padding(.horizontal, horizontalPaddingTabBar)
                }
            }
        }
    }
}

struct Icon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let iconImage: Image
    let tabName: String
    
    let fontSizeIconText: CGFloat = UIScreen.main.bounds.width*0.04
    let widthIconImage: CGFloat = UIScreen.main.bounds.width/15
    let heightIconImage: CGFloat = UIScreen.main.bounds.height/35
    let spacingBetweenImageAndText: CGFloat = UIScreen.main.bounds.height*0.0045
    
    var body: some View {
        VStack {
            Spacer()
            
            Button (action: {
                withAnimation {
                    viewRouter.currentPage = assignedPage
                }
            }) {
                VStack(spacing: spacingBetweenImageAndText) {
                    iconImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: widthIconImage, height: heightIconImage)
                        .foregroundColor(Color.mainWhite)
                        .font(.headline)
                    
                    Text(tabName)
                        .font(.system(size: fontSizeIconText))
                        .foregroundColor(Color.mainWhite)
                }
            }
            .buttonStyle(GrowingButton())
            
            Spacer()
        }
    }
}
