//
//  UserModel.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import Foundation

struct UserInfo: Codable {
    let login: String
    let avatarUrl: String
    let following: Int
    let followers: Int
    let createdAt: Date
    var name: String?
    var email: String?
    var company: String?
}
