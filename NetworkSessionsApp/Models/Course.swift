//
//  Course.swift
//  NetworkSessionsApp
//
//  Created by Павел Широкий on 5.02.2023.
//

import Foundation

struct Course: Decodable {
    
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?

}

struct aboutUs: Decodable {
    
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
    
}

