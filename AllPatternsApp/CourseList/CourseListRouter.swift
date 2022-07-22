//
//  CourseListRouter.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseListRouterProtocol {
    init(viewController: CourseListViewController)
    func routeToCourseDetailsViewController(with course: Course)
}

class CourseListRouter: CourseListRouterProtocol {
    
    unowned let viewController: CourseListViewController
    
    required init(viewController: CourseListViewController) {
        self.viewController = viewController
    }
    
    func routeToCourseDetailsViewController(with course: Course) {
        viewController.performSegue(withIdentifier: "ShowCourseDetails", sender: course)
    }
}
