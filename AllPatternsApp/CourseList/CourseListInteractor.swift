//
//  CourseListInteractor.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 23.07.2022.
//

import Foundation

protocol CourseListBusinessLogic {
    func fetchCourses()
}

protocol CourseListDataStore {
    var courses: [Course] { get }
}

class CourseListInteractor: CourseListBusinessLogic, CourseListDataStore {
    
    var courses: [Course] = []
    var presentor: CourseListPresentationLogic?
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { [weak self] courses in
            self?.courses = courses
            let response = CourseListResponse(courses: courses)
            self?.presentor?.presentCourses(with: response)
        }
    }
    
}
