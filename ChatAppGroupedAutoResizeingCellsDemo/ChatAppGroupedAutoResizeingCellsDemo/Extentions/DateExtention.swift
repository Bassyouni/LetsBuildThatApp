//
//  DateExtention.swift
//  ChatAppGroupedAutoResizeingCellsDemo
//
//  Created by MacBook Pro on 8/31/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import Foundation


extension Date
{
    static func date(fromString dateString: String) -> Date
    {
        let dateFormattor = DateFormatter()
        dateFormattor.dateFormat = "dd/MM/yyyy"
        return dateFormattor.date(from: dateString) ?? Date()
    }
    
    func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: "\(day)/\(month)/\(year)") ?? Date()
    }
    
}
