//
//  WordRealm.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import RealmSwift


// Модель данных Realm для слова
class WordRealm: Object, Identifiable {
    @Persisted var id = UUID().uuidString
    @Persisted var sectionId: String = UUID().uuidString
    @Persisted var word: String = ""
    @Persisted var translation: String = ""
    @Persisted var wordDescription: String = ""
}


class RealmManager {
    static let shared = RealmManager()

    private let realm: Realm

    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Ошибка инициализации базы данных Realm: \(error.localizedDescription)")
        }
    }

    func saveWord(_ word: WordRealm) {
        do {
            try realm.write {
                realm.add(word)
            }
            NotificationCenter.default.post(name: Notification.Name("WordSaved"), object: nil)
        } catch {
            fatalError("Ошибка сохранения слова в базу данных Realm: \(error.localizedDescription)")
        }
    }

    func fetchWords() -> Results<WordRealm> {
        return realm.objects(WordRealm.self)
    }
    
    func deleteWord(_ word: WordRealm) {
            do {
                try realm.write {
                    realm.delete(word)
                }
                NotificationCenter.default.post(name: Notification.Name("WordDeleted"), object: nil)
            } catch {
                fatalError("Ошибка удаления слова из базы данных Realm: \(error.localizedDescription)")
            }
        }
    
    func deleteSection(_ sectionId: String) {
            do {
                try realm.write {
                    let wordsToDelete = realm.objects(WordRealm.self).filter("sectionId == %@", sectionId)
                    realm.delete(wordsToDelete)
                }
                NotificationCenter.default.post(name: Notification.Name("WordDeleted"), object: nil)
            } catch {
                fatalError("Ошибка удаления секции из базы данных Realm: \(error.localizedDescription)")
            }
        }
}

