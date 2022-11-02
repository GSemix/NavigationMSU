//
//  StartPage.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 04.09.2022.
//

import SwiftUI

struct startPage: View {
    @StateObject var viewRouter: ViewRouter
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            Image("startPage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()

                Text("Не тратьте время")
                    .foregroundColor(.white)
                    .font(.system(.title))
                    .bold()

                Text("Постройте оптимальный маршрут по МГУ, ищите нужные места")
                    .foregroundColor(.white)
                    .font(.system(size: UIScreen.main.bounds.width*0.05))
                    .lineLimit(2)
                    .frame(width: UIScreen.main.bounds.width*0.85)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, UIScreen.main.bounds.height*0.02)

                TextField("", text: $text)
                    .modifier(
                        PlaceholderStyle(
                            showPlaceHolder: text.isEmpty,
                            placeholder: "Выберите здание",
                            image: Image("searchIcon"),
                            center: false,
                            color: Color.white
                        )
                    )
                    .textContentType(.dateTime)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.065)
                    .multilineTextAlignment(.leading)
                    .cornerRadius(10)
                    .padding(.bottom, UIScreen.main.bounds.height*0.01)

                Button(action: {
                    withAnimation {
                        self.viewRouter.currentPage = .main
                    }
                }) {
                    HStack {
                        Spacer()
                        
                        Text("Построить маршрут")
                            .foregroundColor(.black)
                            .font(.system(.headline))
                        
                        Spacer()
                    }
                    .padding(.vertical, UIScreen.main.bounds.width*0.04)
                    .background(Color.white)
                    .cornerRadius(7)
                    .clipped()
                }
                .buttonStyle(GrowingButton())
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.065)
                .padding(.bottom, UIScreen.main.bounds.height*0.115)
            }
        }
    }
}
