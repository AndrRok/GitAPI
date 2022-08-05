//
//  FollowersFollowingItemVCSubClass.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit

class FollowersFollowingItemVCSubClass: ItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    

    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
    }
    
}
