//
//  CourseTableViewCell.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with course: Course) {
        var content = defaultContentConfiguration()
        content.text = course.name
        guard let imageData = ImageManager.shared.fetchImage(from: course.imageUrl) else { return }
        content.image = UIImage(data: imageData)
        contentConfiguration = content
    }
}
