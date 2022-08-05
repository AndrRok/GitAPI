//
//  Error.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import Foundation

enum ErrorMessage: String, Error {
    
    case invalidURL         = "URL isinvalid. Please check URL in code."
    case unableToComplete   = "Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
