//
//  DataManager.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()

    private init() {}
    
    private var userDefaults = UserDefaults()
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        let isFavorite = userDefaults.bool(forKey: courseName)
        return isFavorite
    }
    
    func setFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.setValue(status, forKey: courseName)
    }
}
