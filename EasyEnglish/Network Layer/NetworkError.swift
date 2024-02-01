//
//  NetworkError.swift
//  EasyEnglish
//
//  Created by Альпеша on 31.01.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() { }

    func fetchWords(completion: @escaping (Result<[Word], Error>) -> Void) {
        guard let url = URL(string: "https://yourapi.com/words") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.requestFailed))
                return
            }

            do {
                let words = try JSONDecoder().decode([Word].self, from: data)
                completion(.success(words))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
