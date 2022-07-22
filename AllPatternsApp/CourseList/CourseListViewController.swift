//
//  ViewController.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

protocol CourseListViewInputProtocol: AnyObject {
    func reloadData(with section: SectionViewRepresentable)
}

protocol CourseListViewOutputProtocol: AnyObject {
    init(view: CourseListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class CourseListViewController: UIViewController {
    
    @IBOutlet weak var CourseList: UITableView!
    
    private var section: SectionViewRepresentable = CourseSectionViewModel()
    private let configurator: CourseListConfiguratorInputProtocol = CourseListConfigurator()
    private var spinner: UIActivityIndicatorView!    
    var presenter: CourseListViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupActivityIndicator(in: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let courseDetailsVC = segue.destination as! CourseDetailsViewController
        let courseDetailsConfigurator = CourseDetailsConfigurator()
        guard let course = sender as? Course else { return }
        courseDetailsConfigurator.configure(with: courseDetailsVC, and: course)
    }
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as! CourseTableViewCell
        cell.viewModel = viewModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(section.rows[indexPath.row].cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
}

// MARK: - CourseListViewInputProtocol
extension CourseListViewController: CourseListViewInputProtocol {
    func reloadData(with section: SectionViewRepresentable) {
        self.section = section
        spinner.stopAnimating()
        DispatchQueue.main.async {
            self.CourseList.reloadData()
        }
    }
}

// MARK: - UIActivityIndicator
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
