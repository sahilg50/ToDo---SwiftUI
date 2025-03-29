//
//  User.swift
//  Landmarks
//
//  Created by Sahil Gupta on 18/03/25.
//

import Foundation

struct UserModel: Codable {
    let ID: String
    let name: String
    let email: String
    let joined: Date
}
