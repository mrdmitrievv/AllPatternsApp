//
//  CourseListConfigurator.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseListConfiguratorInputProtocol {
    func configure(with viewController: CourseListViewController)
}
class CourseListConfigurator: CourseListConfiguratorInputProtocol {
    func configure(with viewController: CourseListViewController) {
        let presenter = CourseListPresenter(view: viewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
    }
}
