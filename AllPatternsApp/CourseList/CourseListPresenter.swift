//
//  CourseListPresenter.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

class CourseListPresenter: CourseListViewOutputProtocol {
    
    unowned var view: CourseListViewInputProtocol    
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterProtocol!
    
    required init(view: CourseListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getCourse(with: indexPath)
    }
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func receiveCourses(_ courses: [Course]) {
        let section = CourseSectionViewModel()
        courses.forEach { course in
            section.rows.append(CourseCellViewModel(course: course))
        }
        view.reloadData(with: section)
    }
    
    func receiveCourse(_ course: Course) {
        router.routeToCourseDetailsViewController(with: course)
    }
}
