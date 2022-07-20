//
//  ViewController.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

class CourseListViewController: UIViewController {
    
    @IBOutlet weak var CourseList: UITableView!
    
    private var viewModel: CourseListViewModelProtocol! {
        didSet {
            viewModel.getCourses { [unowned self] in
                self.spinner.stopAnimating()
                DispatchQueue.main.async {
                    self.CourseList.reloadData()
                }
            }
        }
    }
    
    private var spinner: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator(in: view)
        viewModel = CourseListViewModel()
        CourseList.rowHeight = 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let courseDetailsVC = segue.destination as! CourseDetailsViewController
        courseDetailsVC.viewModel = sender as? CourseDetailsViewModel
    }
}

// MARK: - UITableViewDataSource
extension CourseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseTableViewCell
        cell.viewModel = viewModel.getViewModelForCell(for: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let CourseDetailsViewModel = viewModel.getCourseDetailsViewModelForSelectedRow(for: indexPath)
        performSegue(withIdentifier: "ShowCourseDetails", sender: CourseDetailsViewModel)
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
