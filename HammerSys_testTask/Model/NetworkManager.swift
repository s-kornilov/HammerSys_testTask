//
//  NetworkManager.swift
//  HammerSys_testTask
//
//  Created by Sergei Kornilov on 13/01/2024.
//

import Foundation

class NetworkManager {
    func fetchData(completion: @escaping (Result<MenuData, Error>) -> Void) {
        
        // Указываем токен и url сервера
        let token = "d97cd10b79mshf2b3d8fd2c7fc34p17ba5ajsn36e98278eaa3"
        guard let url = URL(string: "https://fitbag.ru/api-pizza.php?token=\(token)") else {
            print("Некорректный URL")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("Ошибка запроса: \(error)")
                return
            }
            
            // Парсим data
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let decoder = JSONDecoder()
                        let menu = try decoder.decode(MenuData.self, from: data)
                        completion(.success(menu))
                    } catch {
                        completion(.failure(error))
                        print("Ошибка при декодировании данных: \(error)")
                    }
                }
            }
        }
        dataTask.resume()
    }
}
