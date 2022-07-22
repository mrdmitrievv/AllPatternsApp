//
//  CourseDetailsViewController.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

protocol CourseDetailsViewInputProtocol: AnyObject {
    func displayCourseName(with title: String)
    func displayNumberOfLessons(with title: String)
    func displayNumberOfTests(with title: String)
    func displayImage(with data: Data)
    func displayColorForFavoriteButton(with status: Bool)
}

protocol CourseDetailsViewOutputProtocol: AnyObject {
    init(view: CourseDetailsViewInputProtocol)
    func showDetails()
    func favoriteButtonPressed()
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var numberOfTests: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var presenter: CourseDetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        presenter.favoriteButtonPressed()
    }
}

extension CourseDetailsViewController: CourseDetailsViewInputProtocol {
    func displayCourseName(with title: String) {
        courseName.text = title
    }
    
    func displayNumberOfLessons(with title: String) {
        numberOfLessons.text = title
    }
    
    func displayNumberOfTests(with title: String) {
        numberOfTests.text = title
    }
    
    func displayImage(with data: Data) {
        courseImage.image = UIImage(data: data)
    }
    
    func displayColorForFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
