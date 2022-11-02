//
//  ContentView.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 15.08.2022.
//

import SwiftUI
import ExytePopupView
import SVGView

struct url {
    var stringURL: String
    var typeURL: URLType
}

enum Page {
    case main
    case floor
    case search
    case route
    case menu
    case start
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .start
}

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @State var isPopup: Bool = false
    @State var offsetYSearchLine: CGFloat = .zero
    let trailingPaddingZoomButtons: CGFloat = UIScreen.main.bounds.width*0.05
    @State var zoomScale: Double = 1.0
    
    @EnvironmentObject var sheetManager: SheetManager
    @State var scrollPosition: CGFloat = .zero
    @State var time: String = "150"
    @State var slowdownCoeff: String = "0.0000015"
    @State var delay: String = "3"
    
    @State var config: SheetManager.Config = .init(
        systemName: "info",
        title: "Text Here",
        content: "Other Text",
        minHeight: UIScreen.main.bounds.height * 0.2,
        mainHeight: UIScreen.main.bounds.height * 0.4,
        maxHeight: UIScreen.main.bounds.height * 0.9,
        backgroundColor: .white,
        scrolling: .init(
            isScrollable: true,
            time: 150, // 100
            slowdownCoeff: 0.0000015, // 0.000002 // 0.000003
            delay: 3 // 5
        ),
        tapToGrow: true
    )
    
    @State var safeAreaTop: CGFloat
    @State var safeAreaBottom: CGFloat
    
    @StateObject var viewModel: ViewModel
    @State var currentFloor: Int = 3
    @State var isLoaderVisible = false
    @State var urls: Dictionary<Int, url> = [
        0 : url(stringURL: "Site/local", typeURL: .local),
        2 : url(stringURL: "https://www.google.com", typeURL: .public),
        3 : url(stringURL: "Site/index", typeURL: .local),
        4 : url(stringURL: "https://yandex.ru/maps/213/moscow/?ll=37.621543%2C55.752174&z=15.32", typeURL: .public)
    ]
    @State var message: String = ""
    
    var body: some View {
        switch viewRouter.currentPage {
        case .start:
            startPage(viewRouter: viewRouter)
                .preferredColorScheme(.dark)
        default:
            ZStack {
                MapView(zoomScale: $zoomScale, sheetManager: sheetManager)
                    .ignoresSafeArea()
                
                
//                if self.urls.keys.contains(self.currentFloor) {
//                    WebView(type: self.urls[self.currentFloor]?.typeURL ?? .local, url: self.urls[self.currentFloor]?.stringURL ?? "", viewModel: viewModel, message: self.$message)
//                        .ignoresSafeArea()
//                        .onAppear(perform: {
//                            print("[+] WebView Restarted")
//                        })
//                        .onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
//                            withAnimation {
//                                self.isLoaderVisible = value
//                            }
//
//                            print(">>>>>>>>>>>     \(value)")
//                        }
//                        .onChange(of: self.message) { value in
//                            if value == "Hello" {
//                                withAnimation {
//                                    self.viewRouter.currentPage = .menu
//                                }
//                            }
//                        }
//                } else {
//                    Color.backgroundMap
//                }
                
//                if self.isLoaderVisible {
//                    LoaderView()
//                        .transition(.scale)
//                }
                
                
//                Zoom(zoomScale: $zoomScale) {
//                    Image("map")
//                        .resizable()
//                        .scaledToFit()
//                        .ignoresSafeArea()
//                }
                
                VStack(spacing: 0) {
                    searchLine()
                        .offset(y: self.offsetYSearchLine)
                        .onTapGesture {
                            withAnimation {
                                sheetManager.present(with: config)
                            }
                        }
                        .padding(.top, safeAreaTop)
                    
                    HStack {
                        Spacer()
                        
                        VStack {
                            SelectedRoutesButton(isPopup: $isPopup)
                            
                            ZoomButtons(zoomScale: $zoomScale, viewModel: viewModel)
                                .padding(.top, UIScreen.main.bounds.height*0.2)
                                .padding(.trailing, trailingPaddingZoomButtons)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        floors()
                        
                        Spacer()
                    }
                    
                    fastChoice()
                    
                    tabBarIcons(viewRouter: viewRouter)
                        .padding(.bottom, safeAreaBottom)
                }
                .popup($scrollPosition, with: sheetManager, someContent: AnyView(Text("Hello from ContentView.swift")))
            }
            .background(Color.backgroundMap.ignoresSafeArea())
            .transition(.slide)
            .preferredColorScheme(.light)
        }
        
        
        
        
        
        
        
        //        ZStack {
        //            Color.backgroundMap
        //                .ignoresSafeArea()
        //
        //            switch viewRouter.currentPage {
        //            case .start:
        //                startPage(viewRouter: viewRouter)
        //                    .transition(.move(edge: .leading))
        //                    .preferredColorScheme(.light)
        //            default:
        //                ZStack {
        ////                    MapView(zoomScale: $zoomScale, sheetManager: sheetManager)
        ////                        .ignoresSafeArea()
        //
        //                    Image("map")
        //                        .resizable()
        //                        .scaledToFit()
        //
        //                    VStack {
        //                        searchLine()
        //                            .offset(y: self.offsetYSearchLine)
        //                            .onTapGesture {
        //                                withAnimation {
        //                                    sheetManager.present(with: config)
        //                                }
        //                            }
        //
        //                        HStack {
        //                            Spacer()
        //
        //                            SelectedRoutesButton(isPopup: $isPopup)
        //                        }
        //
        //                        Spacer()
        //                    }
        //
        //                    VStack {
        //                        Spacer()
        //
        //                        HStack {
        //                            Spacer()
        //
        //                            ZoomButtons(zoomScale: $zoomScale)
        //                                .padding(.trailing, trailingPaddingZoomButtons)
        //                        }
        //
        //                        Spacer()
        //                    }
        //
        //                    VStack {
        //                        Spacer()
        //
        //                        //                fastChoice()
        //
        //                        tabBarIcons(viewRouter: viewRouter)
        //                    }
        //                }
        //                .preferredColorScheme(.light)
        ////                .popup(isPresented: $isPopup, type: .toast, position: .bottom, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true) {
        ////                    ZStack {
        ////                        Color.white
        ////                            .cornerRadius(15)
        ////                            .shadow(color: Color.mainGray, radius: 5)
        ////
        ////                        VStack {
        ////                            HStack {
        ////                                Text("Посторить маршрут")
        ////                                    .bold()
        ////                                    .font(.title2)
        ////
        ////                                Spacer()
        ////
        ////                                Button(action: {
        ////                                    self.isPopup = false
        ////                                }) {
        ////                                    Image("closeIcon")
        ////                                        .resizable()
        ////                                        .scaledToFit()
        ////                                        .frame(width: UIScreen.main.bounds.width*0.05, height: UIScreen.main.bounds.width*0.05)
        ////                                        .clipped()
        ////                                }
        ////                            }
        ////                            .padding(.vertical, UIScreen.main.bounds.height*0.025)
        ////
        //////                            HStack {
        //////                                Image()
        ////
        //////                                TextField()
        //////                            }
        ////
        ////                            Spacer()
        ////                        }
        ////                        .padding(.horizontal, UIScreen.main.bounds.height*0.025)
        ////                    }
        ////                }
        //                .onChange(of: self.isPopup) { _ in
        //                    withAnimation(Animation.easeOut(duration: 0.3)) {
        //                        self.offsetYSearchLine = self.isPopup ? (-1)*UIScreen.main.bounds.height*0.25 : .zero
        //                    }
        //                }
        //            }
        //        }
        //        .popup($scrollPosition, with: sheetManager, someContent: AnyView(Text("Hello from ContentView.swift")))
        //        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        //        .padding(.vertical, 50)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewRouter: ViewRouter())
//            .environmentObject(SheetManager(), viewModel: ViewModel())
//    }
//}
