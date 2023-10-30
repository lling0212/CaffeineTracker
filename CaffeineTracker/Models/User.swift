//
//  User.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
//    private var imageName: String
//    let image: Image {
//        Image(imageName)
//    }
    let joined: TimeInterval
}
