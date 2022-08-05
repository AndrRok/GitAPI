//
//  Date+Ext.swift
//  GitHubAPI
//
//  Created by ARMBP on 7/31/22.
//


import Foundation

extension Date {
    
    func convertToDayMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "dd.MM.yy"
        return dateFormatter.string(from: self)
    }
}
