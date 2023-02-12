//
//  CourceCell.swift
//  NetworkSessionsApp
//
//  Created by Павел Широкий on 12.02.2023.
//

import UIKit

class CourceCell: UITableViewCell {

    
    @IBOutlet var nameOfCourse: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var imageOfLesson: UIImageView!
    @IBOutlet var numberOfTests: UILabel!
    

    func configure(with course: Course) {
        nameOfCourse.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.numberOfLessons ?? 0)"
        numberOfTests.text = "Number of tests: \(course.numberOfTests ?? 0)"
        
        DispatchQueue.global().async {
            guard let stringUrl = course.imageUrl else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageOfLesson.image = UIImage(data: imageData)
            }
        }
    }
    
}
