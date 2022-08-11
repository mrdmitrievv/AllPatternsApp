//
//  CourseDetailsInteractor.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 22.07.2022.
//

import Foundation

protocol CourseDetailsBusinessLogic {
    var isFavorite: Bool { get set }
    func provideCourseDetails(with request: ShowDetailsRequest)
    func setFavoriteButton(with request: SetFavoriteStatusRequest)
}

protocol CourseDetailsDataStore {
    var course: Course? { get set }
}

class CourseDetailsInteractor: CourseDetailsBusinessLogic, CourseDetailsDataStore {
    
    var course: Course?
    var worker: CourseDetailsWorker?
    var presenter: CourseDetailsPresentationLogic?
    var isFavorite: Bool = false
    
    func provideCourseDetails(with request: ShowDetailsRequest) {
        worker = CourseDetailsWorker()
        isFavorite = worker?.getFavoriteStatus(from: course?.name ?? "") ?? false
        let imageData = worker?.getImageData(from: course?.imageUrl)
        let response = ShowDetailsResponse(
            courseName: course?.name,
            numberOfLessons: course?.numberOfLessons,
            numberOfTests: course?.numberOfTests,
            imageData: imageData,
            isFavorite: isFavorite
        )
        presenter?.presentCourseDetails(with: response)
    }
    
    func setFavoriteButton(with request: SetFavoriteStatusRequest) {
        isFavorite.toggle()
        worker?.setFavoriteStatus(for: course?.name ?? "", with: isFavorite)
        let response = SetFavoriteStatusResponse(isFavorite: isFavorite)
        presenter?.presentStatusForFavoriteButton(with: response)
    }
}
