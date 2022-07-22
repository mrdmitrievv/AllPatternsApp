//
//  CourseTableViewCellViewModel.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 21.07.2022.
//

import Foundation

protocol CellIdentifiable: AnyObject {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

protocol SectionViewRepresentable: AnyObject {
    var rows: [CellIdentifiable] { get set }
}

class CourseCellViewModel: CellIdentifiable {
    
    var cellIdentifier: String {
        "CourseCell"
    }
    
    var cellHeight: Double {
        100
    }
    
    let name: String
    let imageUrl: URL
    
    init(course: Course) {
        name = course.name
        imageUrl = course.imageUrl
    }
}

class CourseSectionViewModel: SectionViewRepresentable {
    var rows: [CellIdentifiable] = []
}
