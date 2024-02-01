//
//  MainRouter.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import SwiftUI

protocol MainRouterProtocol {
    func navigateToAddWord()
}

class MainRouter: MainRouterProtocol {
    private var isAddWordViewPresented: Binding<Bool>

    init(isAddWordViewPresented: Binding<Bool>) {
        self.isAddWordViewPresented = isAddWordViewPresented
    }

    func navigateToAddWord() {
        isAddWordViewPresented.wrappedValue = true
    }
}
