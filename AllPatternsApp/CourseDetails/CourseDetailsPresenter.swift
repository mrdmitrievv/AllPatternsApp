//
//  CourseDetailsPresenter.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

struct CourseData {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
    var isFavorite: Bool
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    
    unowned var view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.getCourseDetails()
    }
    
    func favoriteButtonPressed() {
        interactor.setStatusForFavoriteButton()
    }
}

extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receiveCourseData(courseData: CourseData) {
        let numberOfLessons = "Number of lessons: \(courseData.numberOfLessons)"
        let numberOfTests = "Number of tests: \(courseData.numberOfTests)"
                
        view.displayCourseName(with: courseData.courseName)
        view.displayNumberOfLessons(with: numberOfLessons)
        view.displayNumberOfTests(with: numberOfTests)
        guard let imageData = courseData.imageData else { return }
        view.displayImage(with: imageData)
        view.displayColorForFavoriteButton(with: courseData.isFavorite)
    }
    
    func receiveStatusForFavoriteButton(with status: Bool) {
        view.displayColorForFavoriteButton(with: status)
    }
}
