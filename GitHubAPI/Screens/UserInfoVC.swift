//
//  UserInfoVC.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit

class UserInfoVC: DataLoadingVC {
    
    let headerView          = UIView()
    let itemViewTwo         = UIView()
    let dateLabel           = BodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    
    var login: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        configureViewController()
        layoutUI()
        
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismssVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: login) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
                
            case .failure(let error):
                self.presentCustomAllertOnMainThred(allertTitle: "Something went wrong", message: error.rawValue, butonTitle: "Ok")
            }
        }
    }
    
    
    func configureUIElements(with user: UserInfo) {
        let followersFollowingItemVC      = FollowersFollowingItemVCSubClass(user: user)
        
        self.add(childVC: followersFollowingItemVC, to: self.itemViewTwo)
        self.add(childVC: UserInfoHeaderVC(user: user), to: self.headerView)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToDayMonthYearFormat())"
    }
    
    
    func layoutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerView, itemViewTwo, dateLabel]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250),
            
            itemViewTwo.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismssVC() {
        dismiss(animated: true)
    }
}
