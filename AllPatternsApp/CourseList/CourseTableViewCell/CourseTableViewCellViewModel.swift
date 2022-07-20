//
//  CourseTableViewCellViewModel.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseTableViewCellViewModelProtocol {
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

class CourseTableViewCellViewModel: CourseTableViewCellViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImage(from: course.imageUrl)
    }
    
    private let course: Course!
   
    required init(course: Course) {
        self.course = course
    }
}
