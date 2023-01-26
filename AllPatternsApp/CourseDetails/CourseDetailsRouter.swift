//
//  CourseDetailsRouter.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 22.07.2022.
//

import Foundation

@objc protocol CourseDetailsRoutingLogic {
}

protocol CourseDetailsDataPassing {
    var dataStore: CourseDetailsDataStore? { get }
}

class CourseDetailsRouter: NSObject, CourseDetailsRoutingLogic, CourseDetailsDataPassing {
    
    weak var viewController: CourseDetailsViewController?
    var dataStore: CourseDetailsDataStore?
}
