//
//  CourseListViewModel.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] { get }
    func getCourses(completion: @escaping() -> Void)
    func getRows() -> Int
    func getViewModelForCell(for indexPath: IndexPath) -> CourseTableViewCellViewModel
    func getCourseDetailsViewModelForSelectedRow(for indexPath: IndexPath) -> CourseDetailsViewModel
}

class CourseListViewModel: CourseListViewModelProtocol {
    
    var courses: [Course] = []
    
    func getCourses(completion: @escaping() -> Void) {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.courses = courses
            completion()
        }
    }
    
    func getRows() -> Int {
        courses.count
    }
    
    func getViewModelForCell(for indexPath: IndexPath) -> CourseTableViewCellViewModel {
        let course = courses[indexPath.row]
        return CourseTableViewCellViewModel(course: course)
    }
    
    func getCourseDetailsViewModelForSelectedRow(for indexPath: IndexPath) -> CourseDetailsViewModel {
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
    
    
}

