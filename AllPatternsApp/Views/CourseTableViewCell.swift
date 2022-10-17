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
        
        ImageManager.shared.fetchImage(from: course.imageUrl, completion: { data in
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                content.image = UIImage(data: imageData)
                self.contentConfiguration = content
            }            
        })
    }
}
