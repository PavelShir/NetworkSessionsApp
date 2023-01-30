//
//  MainViewControllerCollectionViewController.swift
//  NetworkSessionsApp
//
//  Created by Павел Широкий on 30.01.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

enum Link: String {
    case imageURL = "https://applelives.com "
    case courseURL = "https://swiftbook.ru/wp-content/uploads/api/api_course"
    case coursesURL = "https://swiftbook.ru/wp-content/uploads/api/api_courses"
    case aboutUsURL = "https://swiftbook.ru/wp-content/uploads/api/api_website_description"
    case aboutUsURL2 = "https://swiftbook.ru/wp-content/uploads/api/api_missing_or_wrong_fields"
}

enum UserAction: String, CaseIterable {
    case showImage = "Show image"
    case fetchCourse = "Fetch Course"
    case fetchCourses = "Fetch Courses"
    case aboutSwiftBook = "About SwiftBook"
    case aboutSwiftBook2 = "About SwiftBook 2"
    case showCourses = "Show Courses"
}

class MainCollectionViewController: UICollectionViewController {

    private let userAction = UserAction.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userAction.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserActionCell
        else {
            return UICollectionViewCell()
        }
        
        let userAction = userAction[indexPath.item]
        
        cell.userActionLabel.text = userAction.rawValue
        
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let userAction = userAction[indexPath.item]
        
        switch userAction {
        case .showImage:
            performSegue(withIdentifier: "showImage", sender: nil)
        case .fetchCourse: fetchCourse()
        case .fetchCourses: fetchCourses()
        case .aboutSwiftBook: fetchInfoAbout()
        case .aboutSwiftBook2: fetchInfoAboutUsWithEmptyFields()
        case .showCourses: performSegue(withIdentifier: "showCourses", sender: nil)
        }
    }

}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
        
    }
}

extension MainCollectionViewController {
    
    private func fetchCourse(){
        
    }
    
    private func fetchCourses(){
        
    }
    
    private func fetchInfoAbout() {
        
    }
    
    private func fetchInfoAboutUsWithEmptyFields() {
        
    }
    
}
