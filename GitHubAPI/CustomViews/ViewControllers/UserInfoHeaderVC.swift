//
//  UserInfoHeaderVC.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit

class UserInfoHeaderVC: UIViewController {
    
    let avatarImageView     = ImageView(frame: .zero)
    let loginLabel          = TitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel           = SecondaryTitleLabel(fontSize: 18)
    let emailLabel          = SecondaryTitleLabel(fontSize: 18)
    let companyLabel        = BodyLabel(textAlignment: .left)
    
    
    var user: UserInfo!
    
    
    init(user: UserInfo) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }
    
    
    func configureUIElements() {
        avatarImageView.downloadImage(fromURL: user.avatarUrl)
        loginLabel.text          = user.login
        nameLabel.numberOfLines = 3
        nameLabel.text              = user.name ?? ""
        emailLabel.text = "E-mail: \(user.email ?? "No info")"
        companyLabel.numberOfLines = 3
        companyLabel.text = "Companies: \(user.company ?? "No info")"
        
    }
    
    
    func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(loginLabel)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(companyLabel)
    }
    
    
    func layoutUI() {
        let padding: CGFloat            = 20
        let textImagePadding: CGFloat   = 12
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            loginLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            
            companyLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            companyLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            companyLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

