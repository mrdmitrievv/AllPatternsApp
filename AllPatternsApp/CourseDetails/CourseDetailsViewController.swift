//
//  CourseDetailsViewController.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var numberOfTests: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var viewModel: CourseDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {    
        setColorForFavoriteButton(with: viewModel.isFavorite.value)
        viewModel.isFavorite.bind { [unowned self] isFavorite in
            setColorForFavoriteButton(with: isFavorite)
        }
        courseName.text = viewModel.courseName
        numberOfLessons.text = viewModel.numberOfLessons
        numberOfTests.text = viewModel.numberOfTests
        guard let imageData = viewModel.imageData else { return }
        courseImage.image = UIImage(data: imageData)
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        viewModel.favoriteButtonPressed()
    }
    
    private func setColorForFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
