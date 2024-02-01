//
//  ContentView.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            // Ваша главная вью (например, MainView)
            MainView(presenter: MainPresenter(interactor: MainInteractor()))
                .navigationBarTitle("Главная")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
