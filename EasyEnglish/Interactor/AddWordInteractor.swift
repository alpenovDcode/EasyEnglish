//
//  AddWordInteractor.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import Foundation
import RealmSwift

class AddWordInteractor {
    private let realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Ошибка инициализации базы данных Realm: \(error.localizedDescription)")
        }
    }
    
    func saveWord(_ word: Word) {
        let wordRealm = WordRealm()
        wordRealm.word = word.word
        wordRealm.translation = word.translation
        wordRealm.wordDescription = word.description
        
        do {
            try realm.write {
                realm.add(wordRealm)
            }
            NotificationCenter.default.post(name: Notification.Name("WordSaved"), object: nil)
        } catch {
            fatalError("Ошибка сохранения слова в базу данных Realm: \(error.localizedDescription)")
        }
    }
}
