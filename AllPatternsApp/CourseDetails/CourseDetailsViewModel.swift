//
//  CourseDetailsViewModel.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseDetailsViewModelProtocol: AnyObject {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Box<Bool> { get }
    init(course: Course)
    func favoriteButtonPressed()
    
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)? { get set }
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImage(from: course.imageUrl)
    }
    
    var isFavorite: Box<Bool>
    
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)?
    
    private var course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = Box(value: DataManager.shared.getFavoriteStatus(for: course.name))
    }
    
    func favoriteButtonPressed() {
        isFavorite.value.toggle()
        DataManager.shared.setFavoriteStatus(for: course.name, with: isFavorite.value)
    }
}
