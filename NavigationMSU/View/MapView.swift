//
//  MapView.swift
//  NavigationMSU
//
//  Created by Семен Безгин on 01.09.2022.
//

import SwiftUI
import SVGView

struct MapView: View {
    @Binding var zoomScale: Double
    @StateObject  var sheetManager: SheetManager
    
    var body: some View {
        Zoom(zoomScale: $zoomScale) {
//        ScrollView([.vertical, .horizontal]) {
//            Image("map")
//                .resizable()
//                .aspectRatio(contentMode: .fit)

            Map(sheetManager: sheetManager)
            
        }
    }
}

struct Map: View {
    @StateObject var sheetManager: SheetManager
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
    @State var parts: Dictionary<String, Double> = [
        "qwe": 1.0,
        "metro": 1.0
    ]
    
    var body: some View {
        var planHuy: Bool = false
        let view = SVGView(fileURL: Bundle.main.url(forResource: "newMap", withExtension: "svg")!)
        
        if let part = view.getNode(byId: "qwe") {
            part.opacity = parts["qwe"]!
            
            part.onTapGesture {
                if planHuy {
                    //
                    if part.opacity == 0.2 {
                        parts["qwe"] = 1.0
                        part.opacity = 1.0
                    } else {
                        parts["qwe"] = 0.2
                        part.opacity = 0.2
                    }
                    print("qwe")
                    DispatchQueue.main.async {
                        config.title = "Cab"
                        withAnimation {
                            sheetManager.present(with: config)
                        }
                    }
                    //
                    planHuy = false
                } else {
                    planHuy = true
                }
                
            }
        }
        
        if let part = view.getNode(byId: "metro") {
            part.opacity = parts["metro"]!
            
            part.onTapGesture {
                if planHuy {
                    //
                    if part.opacity == 0.2 {
                        parts["metro"] = 1.0
                        part.opacity = 1.0
                    } else {
                        parts["metro"] = 0.2
                        part.opacity = 0.2
                    }
                    print("metro")
                    
                    DispatchQueue.main.async {
                        config.title = "Metro"
                        withAnimation {
                            sheetManager.present(with: config)
                        }
                    }
                    
                    //
                    planHuy = false
                } else {
                    planHuy = true
                }
                
            }
        }
        
        return view
    }
}

