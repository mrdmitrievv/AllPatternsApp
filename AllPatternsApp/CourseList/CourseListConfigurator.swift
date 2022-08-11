//
//  CourseListConfigurator.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 23.07.2022.
//

import Foundation

protocol CourseListConfiguratorProtocol {
    func configure(with viewController: CourseListViewController)
}

class CourseListConfigurator: CourseListConfiguratorProtocol {
    func configure(with viewController: CourseListViewController) {
        let interactor = CourseListInteractor()
        let presentor = CourseListPresentor()
        let router = CourseListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presentor = presentor
        presentor.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
