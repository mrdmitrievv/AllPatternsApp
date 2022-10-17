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
    
    private var isFavorite: Bool = false {
        didSet {
            favoriteButton.tintColor = isFavorite ? .red : .gray
        }
    }
    
    var course: Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {    
        courseName.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTests.text = "Number of tests: \(course.numberOfTests)"
        ImageManager.shared.fetchImage(from: course.imageUrl) { data in
            guard let imageData = data else { return }
            DispatchQueue.main.async {        
                self.courseImage.image = UIImage(data: imageData)
            }
        }
        isFavorite = DataManager.shared.getFavoriteStatus(for: course.name)
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        isFavorite.toggle()
        DataManager.shared.setFavoriteStatus(for: course.name, with: isFavorite)
    }
    
}
