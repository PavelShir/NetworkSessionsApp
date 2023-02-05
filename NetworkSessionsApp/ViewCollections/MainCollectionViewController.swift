//
//  MainViewControllerCollectionViewController.swift
//  NetworkSessionsApp
//
//  Created by Павел Широкий on 30.01.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

enum Link: String {
    case imageURL = "https://images.unsplash.com/photo-1518495973542-4542c06a5843?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80"
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
    
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the result",
                preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func errorAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Error",
                message: "Some problems",
                preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
}

extension MainCollectionViewController {
    
    private func fetchCourse(){
        guard let url = URL(string: Link.courseURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No localized description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let course = try jsonDecoder.decode(Course.self, from: data)
                self.successAlert()
            } catch {
                print(error.localizedDescription)
                self.errorAlert()
            }
        }.resume()
    }
        
        private func fetchCourses(){
            guard let url = URL(string: Link.coursesURL.rawValue) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No localized description")
                    return
                }
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let course = try jsonDecoder.decode([Course].self, from: data)
                    self.successAlert()
                } catch {
                    print(error.localizedDescription)
                    self.errorAlert()
                }
            }.resume()
        }
        
        private func fetchInfoAbout() {
            guard let url = URL(string: Link.aboutUsURL.rawValue) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No localized description")
                    return
                }
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let aboutUs = try jsonDecoder.decode(aboutUs.self, from: data)
                    self.successAlert()
                } catch {
                    print(error.localizedDescription)
                    self.errorAlert()
                }
            }.resume()
        }
        
        private func fetchInfoAboutUsWithEmptyFields() {
            guard let url = URL(string: Link.aboutUsURL2.rawValue) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No localized description")
                    return
                }
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let aboutUs = try jsonDecoder.decode(aboutUs.self, from: data)
                    self.successAlert()
                } catch {
                    print(error.localizedDescription)
                    self.errorAlert()
                }
            }.resume()
        }
        
    }
    

