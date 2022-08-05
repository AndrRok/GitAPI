//
//  UITableView+Ext.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//

import UIKit

extension UITableView{
    
    func removeExcessCells(){
        tableFooterView = UIView(frame: .zero)
    }
}

