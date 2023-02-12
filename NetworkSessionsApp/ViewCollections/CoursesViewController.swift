//
//  CoursesViewController.swift
//  NetworkSessionsApp
//
//  Created by Павел Широкий on 30.01.2023.
//

import UIKit

class CoursesViewController: UITableViewController {
    
    private var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchCourses()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        courses.count
    }
    
    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showCourses", for: indexPath) as? CourceCell
        else { return UITableViewCell() }
        
        let course = courses[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
}
   
extension CoursesViewController {
    
    func fetchCourses() {
        guard let url = URL(string: Link.coursesURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No localized description")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.courses = try jsonDecoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
                
            }
        }.resume()
    }
}

    



