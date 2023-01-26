//
//  CourseListRouter.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 23.07.2022.
//

import UIKit

@objc protocol CourseListRoutingLogic {
    func routeToCourseDetails(segue: UIStoryboardSegue?)
}

protocol CourseListDataPassing {
    var dataStore: CourseListDataStore? { get }
}

class CourseListRouter: NSObject, CourseListRoutingLogic, CourseListDataPassing {
    
    weak var viewController: CourseListViewController?
    var dataStore: CourseListDataStore?
    
    // MARK: Routing
    func routeToCourseDetails(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! CourseDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToCourseDetails(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! CourseDetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToCourseDetails(source: dataStore!, destination: &destinationDS)
            navigateToCourseDetails(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    func navigateToCourseDetails(source: CourseListViewController, destination: CourseDetailsViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    func passDataToCourseDetails(source: CourseListDataStore, destination: inout CourseDetailsDataStore) {
        guard let indexPath = viewController?.CourseList.indexPathForSelectedRow else { return }
        destination.course = source.courses[indexPath.row]
    }
}

