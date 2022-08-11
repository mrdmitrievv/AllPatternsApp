//
//  CourseDetailsWorker.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 23.07.2022.
//

import Foundation

class CourseDetailsWorker {
    func getImageData(from url: URL?) -> Data? {
        ImageManager.shared.fetchImage(from: url)
    }
    
    func getFavoriteStatus(from courseName: String) -> Bool {
        DataManager.shared.getFavoriteStatus(for: courseName)
    }
    
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        DataManager.shared.setFavoriteStatus(for: courseName, with: status)
    }
}
