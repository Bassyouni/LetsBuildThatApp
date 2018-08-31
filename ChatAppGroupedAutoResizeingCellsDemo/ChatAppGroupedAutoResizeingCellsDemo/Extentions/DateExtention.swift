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
}
