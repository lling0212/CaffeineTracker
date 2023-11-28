//
//  User.swift
//  CaffeineTracker
//
//  Created by Lisa's Mac Pro on 2023/10/18.
//

import Foundation

struct User: Codable, Equatable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let joined: TimeInterval
    let profileURL: String
}
