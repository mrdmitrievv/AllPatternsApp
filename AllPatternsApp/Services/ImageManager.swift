//
//  ImageManager.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else { return completion(nil) }
       
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                completion(image)
            }
        }.resume()
    }
}
