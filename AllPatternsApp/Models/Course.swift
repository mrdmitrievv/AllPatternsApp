//
//  Course.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}
