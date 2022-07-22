//
//  NetworkManager.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let api = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ course: [Course]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                DataManager.shared.setCourses(courses)
                DispatchQueue.main.async {
                    completion(courses)
                }
            } catch let error {
                print("Error serialization JSON", error)
            }
        }.resume()
    }
}
