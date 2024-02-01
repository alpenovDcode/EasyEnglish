//
//  MainPresenter.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import RealmSwift

class MainPresenter: ObservableObject {
    private let interactor: MainInteractor
    @Published var words: Results<WordRealm> = RealmManager.shared.fetchWords()
    var router: MainRouterProtocol?
    var sections: [String: [WordRealm]] = [:]
    

    init(interactor: MainInteractor) {
        self.interactor = interactor

        NotificationCenter.default.addObserver(self, selector: #selector(handleWordSaved), name: Notification.Name("WordSaved"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(handleUpdateWords), name: Notification.Name("UpdateWords"), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func didTapAddButton() {
        router?.navigateToAddWord()
    }
    
    func addWord(_ word: WordRealm) {
        RealmManager.shared.saveWord(word)
        NotificationCenter.default.post(name: Notification.Name("UpdateWords"), object: nil)
    }

    @objc private func handleWordSaved() {
        words = RealmManager.shared.fetchWords()
    }

    @objc private func handleUpdateWords() {
        words = RealmManager.shared.fetchWords()
    }
    
}
