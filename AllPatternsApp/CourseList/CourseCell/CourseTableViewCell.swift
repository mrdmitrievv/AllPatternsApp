//
//  CourseTableViewCell.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

protocol CellModelRepresentable: AnyObject {
    var viewModel: CellIdentifiable? { get set }
}

class CourseTableViewCell: UITableViewCell, CellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let CourseCellViewModel = viewModel as? CourseCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = CourseCellViewModel.name
        guard let imageData = ImageManager.shared.fetchImage(from: CourseCellViewModel.imageUrl) else { return }
        content.image = UIImage(data: imageData)
        contentConfiguration = content
    }
}
