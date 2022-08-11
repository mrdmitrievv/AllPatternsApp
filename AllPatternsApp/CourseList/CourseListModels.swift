//
//  CourseListModels.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 23.07.2022.
//

import Foundation

typealias cellViewModel = CourseList.ShowCourses.ViewModel.cellViewModel
typealias CourseListResponse = CourseList.ShowCourses.Response
typealias CourseListViewModel = CourseList.ShowCourses.ViewModel

protocol CellIdentifiable {
    var identificator: String { get }
    var cellHeight: Double { get }
}

enum CourseList {
    
    // MARK: - Use cases
    enum ShowCourses {
        
        struct Request {}
        
        struct Response {
            let courses: [Course]
        }
        
        struct ViewModel {
            
            struct cellViewModel: CellIdentifiable {
                
                var name: String
                var imageUrl: URL
                
                var identificator: String {
                    "CourseCell"
                }
                
                var cellHeight: Double {
                    100
                }
                
                init(course: Course) {
                    self.name = course.name
                    self.imageUrl = course.imageUrl
                }
            }
            
            let rows: [CellIdentifiable]
        }
    }
}
