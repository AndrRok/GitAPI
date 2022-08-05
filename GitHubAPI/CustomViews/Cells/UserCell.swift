//
//  UserCell.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit

class UserCell: UITableViewCell {
    
    static let reuseID = "UserCell"
    
    let avatarImageView = ImageView(frame: .zero)
    let loginLabel   = TitleLabel(textAlignment: .center, fontSize: 16)
    let idLabel = SecondaryTitleLabel(fontSize: 12)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(user: Users){
        loginLabel.text = user.login
        idLabel.text    = "User ID: \(String(user.id))"
        avatarImageView.downloadImage(fromURL: user.avatarUrl)
    }
    
    
    private func configure(){
        self.addSubviews(avatarImageView, loginLabel, idLabel)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            
            loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 100),
            loginLabel.heightAnchor.constraint(equalToConstant: 40),
            
            idLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 12),
            idLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            idLabel.heightAnchor.constraint(equalToConstant: 20),
            idLabel.widthAnchor.constraint(equalToConstant: 70)
            
            
        ])
    }
    
}
