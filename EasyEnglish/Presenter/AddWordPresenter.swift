//
//  AddWordPresenter.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import Foundation

class AddWordPresenter: ObservableObject {
    private let interactor: AddWordInteractor
    @Published var word: String = ""
    @Published var translation: String = ""
    @Published var description: String = ""

    init(interactor: AddWordInteractor) {
        self.interactor = interactor
    }

    func didTapSaveButton() {
        let newWord = Word(word: word, translation: translation, description: description)
        interactor.saveWord(newWord)
    }
    
    func saveWord() {
            let wordRealm = WordRealm()
            wordRealm.word = word
            wordRealm.translation = translation
            wordRealm.wordDescription = description

            RealmManager.shared.saveWord(wordRealm)

            NotificationCenter.default.post(name: Notification.Name("UpdateWords"), object: nil)
        }
}
