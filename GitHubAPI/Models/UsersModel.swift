//
//  UsersModel.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import Foundation

struct Users: Codable, Hashable {
    let login: String
    let id: Int
    let avatarUrl: String
}
