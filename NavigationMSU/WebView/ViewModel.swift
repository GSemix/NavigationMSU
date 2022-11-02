//
//  ViewModel.swift
//  3DMap
//
//  Created by Семен Безгин on 05.08.2022.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var isLoaderVisible = PassthroughSubject<Bool, Never>();
    @Published var webTitle = PassthroughSubject<String, Never>()
    @Published var webViewNavigationPublisher = PassthroughSubject<WebViewNavigationAction, Never>()
}
