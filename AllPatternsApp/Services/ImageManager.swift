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
        
        // MARK: - WorkItem, downloading works slower than URLSession
        var data: Data?
        let queue = DispatchQueue.global(qos: .utility)
        let workItem = DispatchWorkItem(qos: .utility) {
            data = try? Data(contentsOf: url)
            completion(data)
        }
        
        queue.async(execute: workItem)
        
        /*
        // MARK: - URLSession
         
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let imageData = data else { return }
            completion(imageData)
        }.resume()
        */
    }
}
