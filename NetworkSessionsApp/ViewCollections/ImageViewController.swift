//
//  ViewController.swift
//  NetworkSessionsApp
//
//  Created by Павел Широкий on 29.01.2023.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    private func fetchImage() {
        guard let url = URL(string: Link.imageURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No localized description")
                return
            }
            print(response)
            
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
                self.activityIndicator.hidesWhenStopped = true
            }
            
        }
        .resume()
        
        
    }

 
}

