//
//  TabBarController.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().tintColor       = .systemOrange
        
        viewControllers                       = [createUsersNC(), createEmojisNC()]
    }
    
    
    func createUsersNC() -> UINavigationController{
        let gHUsersVC          = GHUsersVC()
        gHUsersVC.tabBarItem = UITabBarItem(title: "GH users", image: UIImage(systemName: "person.circle.fill"), tag: 0)
        return UINavigationController(rootViewController: gHUsersVC)
    }
    
    
    func createEmojisNC() -> UINavigationController{
        let emojiVC   = EmojiVC()
        emojiVC.tabBarItem = UITabBarItem(title: "Emojis", image: UIImage(systemName: "face.smiling"), tag: 0)
        return UINavigationController(rootViewController: emojiVC)
    }
}
