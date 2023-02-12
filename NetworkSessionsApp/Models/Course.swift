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
    let numberOfLessons: Int?
    let numberOfTests: Int?

}

struct aboutUs: Decodable {
    
    let courses: [Course]?
    let websiteDescription: String?
    let websiteName: String?
    
}

