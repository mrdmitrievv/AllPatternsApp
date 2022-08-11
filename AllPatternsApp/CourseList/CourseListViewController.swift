//
//  ViewController.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

protocol CourseListDisplayLogic {
    func displayCourseList(with viewModel: CourseListViewModel)
}

class CourseListViewController: UIViewController {
    
    @IBOutlet weak var CourseList: UITableView!
    
    var interactor: CourseListBusinessLogic?
    var router: (NSObjectProtocol & CourseListRoutingLogic & CourseListDataPassing)?
    var configurator: CourseListConfiguratorProtocol = CourseListConfigurator()
    
    private var rows: [CellIdentifiable] = []
    private var spinner: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        setupActivityIndicator(in: view)
        getCourses()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func getCourses() {
        interactor?.fetchCourses()
    }    
}

// MARK: - CourseListDisplayLogic
extension CourseListViewController: CourseListDisplayLogic {
    func displayCourseList(with viewModel: CourseListViewModel) {
        rows = viewModel.rows
        spinner.stopAnimating()
        DispatchQueue.main.async {
            self.CourseList.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identificator, for: indexPath) as! CourseTableViewCell
        cell.cellModel = cellViewModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(rows[indexPath.row].cellHeight)
    }
}

// MARK: - ActivityIndicator
extension CourseListViewController {
    private func setupActivityIndicator(in view: UIView) {
        spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.color = .black
        spinner.center = view.center
        spinner.startAnimating()
        
        view.addSubview(spinner)
    }
}
