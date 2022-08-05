//
//  EmojiModel.swift
//  GitHubAPI
//
//  Created by ARMBP on 8/2/22.
//

import Foundation


struct Emoji: Hashable{
    var id = UUID()
    let sign: String
    let imageUrl: String
}
