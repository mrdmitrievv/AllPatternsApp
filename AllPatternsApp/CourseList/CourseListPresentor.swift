//
//  CourseListPresentor.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 23.07.2022.
//

import Foundation

protocol CourseListPresentationLogic {
    func presentCourses(with response: CourseListResponse)
}

class CourseListPresentor: CourseListPresentationLogic {
    var viewController: CourseListDisplayLogic?
    
    func presentCourses(with response: CourseListResponse) {
        var rows: [CellIdentifiable] = []
        response.courses.forEach { course in
            rows.append(cellViewModel(course: course))
        }
        let viewModel = CourseListViewModel(rows: rows)
        viewController?.displayCourseList(with: viewModel)
    }
}
