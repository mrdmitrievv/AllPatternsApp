//
//  CourseDetailsInteractor.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    var isFavorite: Bool { get set }
    init(presenter: CourseDetailsInteractorOutputProtocol, and course: Course)
    func getCourseDetails()
    func setStatusForFavoriteButton()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receiveCourseData(courseData: CourseData)
    func receiveStatusForFavoriteButton(with status: Bool)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    
    unowned var presenter: CourseDetailsInteractorOutputProtocol
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: course.name)
        } set {
            DataManager.shared.setFavoriteStatus(for: course.name, with: newValue)
        }
    }
    
    private var course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, and course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func getCourseDetails() {
        let courseData = CourseData(
            courseName: course.name,
            numberOfLessons: course.numberOfLessons,
            numberOfTests: course.numberOfTests,
            imageData: ImageManager.shared.fetchImage(from: course.imageUrl),
            isFavorite: isFavorite
        )
        presenter.receiveCourseData(courseData: courseData)
    }
    
    func setStatusForFavoriteButton() {
        isFavorite.toggle()
        presenter.receiveStatusForFavoriteButton(with: isFavorite)
    }
}
