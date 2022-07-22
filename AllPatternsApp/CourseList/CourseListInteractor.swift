
//  CourseListInteractor.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseListInteractorInputProtocol: AnyObject {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
    func getCourse(with indexPath: IndexPath)
   
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    func receiveCourses(_ courses: [Course])
    func receiveCourse(_ course: Course)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    
    unowned var presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.presenter.receiveCourses(courses)
        }
    }
    
    func getCourse(with indexPath: IndexPath) {
        let course = DataManager.shared.getCourse(at: indexPath)
        presenter.receiveCourse(course)
    }
    
    
}
