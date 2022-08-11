//
//  CourseDetailsViewController.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

protocol CourseDetailsDisplayLogic: AnyObject {
    func displayCourseDetails(with viewModel: ShowDetailsViewModel)
    func setFavoriteButtonColor(with viewModel: SetFavoriteStatusViewModel)
}

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var numberOfLessons: UILabel!
    @IBOutlet weak var numberOfTests: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var interactor: CourseDetailsBusinessLogic?
    var router: (NSObjectProtocol & CourseDetailsRoutingLogic & CourseDetailsDataPassing)?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passRequest()
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        let request = SetFavoriteStatusRequest()
        interactor?.setFavoriteButton(with: request)
    }
    
    private func passRequest() {
        let request = ShowDetailsRequest()
        interactor?.provideCourseDetails(with: request)
    }
    
    private func setup() {
        let viewController = self
        let interactor = CourseDetailsInteractor()
        let presenter = CourseDetailsPresenter()
        let router = CourseDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension CourseDetailsViewController: CourseDetailsDisplayLogic {
    func displayCourseDetails(with viewModel: ShowDetailsViewModel) {
        courseName.text = viewModel.courseName
        numberOfLessons.text = viewModel.numberOfLessons
        numberOfTests.text = viewModel.numberOfTests
        courseImage.image = UIImage(data: viewModel.imageData)
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
    
    func setFavoriteButtonColor(with viewModel: SetFavoriteStatusViewModel) {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
}
