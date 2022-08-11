//
//  CourseTableViewCell.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

protocol cellModelRepresentable {
    var cellModel: CellIdentifiable? { get set }
}

class CourseTableViewCell: UITableViewCell, cellModelRepresentable {
    var cellModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let cellModel = cellModel as? cellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = cellModel.name
        guard let imageData = ImageManager.shared.fetchImage(from: cellModel.imageUrl) else { return }
        content.image = UIImage(data: imageData)
        contentConfiguration = content
    }
}
