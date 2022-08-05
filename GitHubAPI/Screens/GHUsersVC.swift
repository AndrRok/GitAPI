//
//  GHUsers.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit


class GHUsersVC: DataLoadingVC {
    
    let tableView = UITableView()
    
    var usersArray: [Users] = []
    var page                = 0
    var moreUsers           = true
    var isLoadingMoreUsers  = false
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGHUsers(page: page)
        configureViewController()
        configureTableView()
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
    }
    
    
    func getGHUsers(page: Int) {
        showLoadingView()
        isLoadingMoreUsers = true
        NetworkManager.shared.getAllUsers(page: page){ [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
            case .success(let usersArray):
                print("\(usersArray.count)")
                if usersArray.count < 20{self.moreUsers = false}
                else {self.moreUsers = true}
                self.usersArray.append(contentsOf: usersArray)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
                
            case .failure(let error):
                self.presentCustomAllertOnMainThred(allertTitle: "Bad Stuff Happend", message: error.rawValue, butonTitle: "Ok")
            }
            self.isLoadingMoreUsers = false
        }
        
    }
    
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .systemGray
        tableView.frame           = view.bounds
        tableView.rowHeight       = 250
        tableView.delegate        = self
        tableView.dataSource      = self
        
        tableView.removeExcessCells()
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseID)
    }
}

extension GHUsersVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseID) as! UserCell
        let user = usersArray[indexPath.row]
        cell.set(user: user)
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = usersArray[indexPath.row]
        let destinationVC = UserInfoVC()
        destinationVC.login = user.login
        
        let navController = UINavigationController(rootViewController: destinationVC)
        present(navController, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offSetY       = scrollView.contentOffset.y//already scrolled data
        let contentHeight = scrollView.contentSize.height//total height of data
        let height        = scrollView.frame.size.height//screen height
        
        if offSetY > contentHeight - height{
            
            guard moreUsers, !isLoadingMoreUsers else {return}
            page += 46
            getGHUsers(page: page)
        }
        
    }
    
}





