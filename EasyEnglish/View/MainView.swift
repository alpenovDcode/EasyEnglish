//
//  MainView.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var presenter: MainPresenter
    @State private var isAddWordViewPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(presenter.words) { word in
                    Section() {
                        Text("Слово: \(word.word)")
                        Text("Перевод: \(word.translation)")
                        Text("Описание: \(word.wordDescription)")
                    }
                }
            }
            .navigationTitle("EasyEnglish")
            .navigationBarItems(
                trailing: NavigationLink(destination: AddWordView(presenter: AddWordPresenter(interactor: AddWordInteractor()))) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isAddWordViewPresented) {
                AddWordView(presenter: AddWordPresenter(interactor: AddWordInteractor()))
            }
        }
    }
}

