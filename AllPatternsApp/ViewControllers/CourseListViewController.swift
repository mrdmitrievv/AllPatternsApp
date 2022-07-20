//
//  ViewController.swift
//  AllPatternsApp
//
//  Created by Артём Дмитриев on 19.07.2022.
//

import UIKit

class CourseListViewController: UIViewController {
    
    @IBOutlet weak var CourseList: UITableView!
    
    private var courses: [Course] = [] {
        didSet {
            spinner.stopAnimating()
        }
    }
    
    private var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CourseList.rowHeight = 100
        setupActivityIndicator(in: view)
        getCourses()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let courseDetailsVC = segue.destination as! CourseDetailsViewController
        courseDetailsVC.course = sender as? Course
    }
    
    private func getCourses() {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.courses = courses
            DispatchQueue.main.async {
                self.CourseList.reloadData()
            }
        }
    }
    
    private func setupActivityIndicator(in view: UIView) {
        spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.color = .black
        spinner.center = view.center
        spinner.startAnimating()
        
        view.addSubview(spinner)
    }
}

extension CourseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseTableViewCell
        let course = courses[indexPath.row]
        cell.configure(with: course)
        return cell
    }
}

extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let course = courses[indexPath.row]
        performSegue(withIdentifier: "ShowCourseDetails", sender: course)
    }
}

