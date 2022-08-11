//
//  CourseDetailsPresenter.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 22.07.2022.
//

import Foundation

protocol CourseDetailsPresentationLogic {
    func presentCourseDetails(with response: ShowDetailsResponse)
    func presentStatusForFavoriteButton(with response: SetFavoriteStatusResponse)
}

class CourseDetailsPresenter: CourseDetailsPresentationLogic {
    
    weak var viewController: CourseDetailsDisplayLogic?
    
    func presentCourseDetails(with response: ShowDetailsResponse) {
        let numberOfLessons = "Number of lessons: \(response.numberOfLessons ?? 0)"
        let numberOfTests = "Number of tests: \(response.numberOfTests ?? 0)"
        
        let viewModel = ShowDetailsViewModel(
            courseName: response.courseName ?? "",
            numberOfLessons: numberOfLessons,
            numberOfTests: numberOfTests,
            imageData: response.imageData ?? Data(),
            isFavorite: response.isFavorite)
        viewController?.displayCourseDetails(with: viewModel)
    }
    
    func presentStatusForFavoriteButton(with response: SetFavoriteStatusResponse) {
        let viewModel = SetFavoriteStatusViewModel(isFavorite: response.isFavorite)
        viewController?.setFavoriteButtonColor(with: viewModel)
    }
}
