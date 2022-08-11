//
//  CourseDetailsModels.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 22.07.2022.
//

import Foundation

typealias ShowDetailsRequest = CourseDetails.ShowDetails.Request
typealias ShowDetailsResponse = CourseDetails.ShowDetails.Response
typealias ShowDetailsViewModel = CourseDetails.ShowDetails.ViewModel
typealias SetFavoriteStatusRequest = CourseDetails.SetFavoriteStatus.Request
typealias SetFavoriteStatusResponse = CourseDetails.SetFavoriteStatus.Response
typealias SetFavoriteStatusViewModel = CourseDetails.SetFavoriteStatus.ViewModel

enum CourseDetails {
    
    // MARK: - Use cases
    enum ShowDetails {
        
        struct Request {}
        
        struct Response {
            let courseName: String?
            let numberOfLessons: Int?
            let numberOfTests: Int?
            let imageData: Data?
            let isFavorite: Bool
        }
        
        struct ViewModel {
            let courseName: String
            let numberOfLessons: String
            let numberOfTests: String
            let imageData: Data
            let isFavorite: Bool
        }
    }
    
    enum SetFavoriteStatus {
        
        struct Request {}
        
        struct Response {
            let isFavorite: Bool
        }
        
        struct ViewModel {
            let isFavorite: Bool
        }
    }
}
