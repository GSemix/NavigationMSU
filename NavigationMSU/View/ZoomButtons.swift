//
//  ZoomButtons.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI

struct ZoomButtons: View {
    @Binding var zoomScale: Double
    let maxZoom: Double = 5.0
    let minZoom: Double = 1.0
    let difference: Double = 1.0
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 7)
            .foregroundColor(Color.mainWhite)
            .shadow(color: Color.mainGray, radius: 5)
            .overlay(content: {
                VStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
//                            viewModel.webViewNavigationPublisher.send(.plus)
                            
                            if self.zoomScale <= maxZoom - difference {
                                self.zoomScale += difference
                            } else {
                                self.zoomScale = maxZoom
                            }
                        }
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.mainBlack)
                            .frame(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.02)
                            .font(.headline)
                    }
                    .buttonStyle(GrowingButton())
                    
                    Spacer()
                    
                    GrayLine(width: UIScreen.main.bounds.width*0.1)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
//                            viewModel.webViewNavigationPublisher.send(.minus)
                            
                            if self.zoomScale >= minZoom + difference {
                                self.zoomScale -= difference
                            } else {
                                self.zoomScale = minZoom
                            }
                        }
                    }) {
                        Image(systemName: "minus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.mainBlack)
                            .frame(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.02)
                            .background(Color.white)
                            .font(.headline)
                    }
                    .buttonStyle(GrowingButton())
                    
                    Spacer()
                }
            })
            .frame(width: UIScreen.main.bounds.width*0.15, height: UIScreen.main.bounds.height*0.125)
//            .padding(.trailing, UIScreen.main.bounds.width*0.02)
    }
}
