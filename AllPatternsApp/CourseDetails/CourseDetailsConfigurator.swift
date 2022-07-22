//
//  CourseDetailsConfigurator.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 20.07.2022.
//

import Foundation

protocol CourseDetailsConfiguratorProtocol {
    func configure(with viewController: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorProtocol {
    func configure(with viewController: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: viewController)
        let interactor = CourseDetailsInteractor(presenter: presenter, and: course)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
