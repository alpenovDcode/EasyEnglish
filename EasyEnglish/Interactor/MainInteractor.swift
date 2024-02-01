//
//  MainInteractor.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//


import Foundation
import RealmSwift

class MainInteractor {
    private let realm: Realm

    init() {
        let config = Realm.Configuration(
            schemaVersion: 2, // Обновите версию до 2
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    // Добавляем новое поле id в структуру данных, чтобы соответствовать Identifiable
                    migration.enumerateObjects(ofType: WordRealm.className()) { oldObject, newObject in
                        newObject!["id"] = UUID().uuidString
                    }
                }
            }
        )
        
        do {
            realm = try Realm(configuration: config)
        } catch {
            fatalError("Ошибка инициализации базы данных Realm: \(error.localizedDescription)")
        }
    }

    func fetchWords() -> [Word] {
        let wordResults = realm.objects(WordRealm.self)
        let words = wordResults.map { Word(word: $0.word, translation: $0.translation, description: $0.description) }
        return Array(words)
    }
}
