//
//  ImageManager.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import Foundation

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL?, completion: @escaping (Data?) -> Void) {
        guard let url = url else { return completion(nil) }
        
        // MARK: - URLSession
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let imageData = data else { return }
            completion(imageData)
        }.resume()
    }
}
