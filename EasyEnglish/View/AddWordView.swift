//
//  AddWordView.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import SwiftUI


struct AddWordView: View {
    @ObservedObject var presenter: AddWordPresenter
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Добавить слово")) {
                    TextField("Слово", text: $presenter.word)
                    TextField("Перевод", text: $presenter.translation)
                    TextField("Описание", text: $presenter.description)
                }
            }
            .navigationTitle("Добавить слово")
            .navigationBarItems(
                trailing: Button(action: {
                    presenter.didTapSaveButton()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Сохранить")
                }
            )
        }
    }
}
