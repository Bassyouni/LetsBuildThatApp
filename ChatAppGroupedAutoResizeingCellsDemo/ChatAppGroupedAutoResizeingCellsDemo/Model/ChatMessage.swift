//
//  ChatMessage.swift
//  ChatAppGroupedAutoResizeingCellsDemo
//
//  Created by MacBook Pro on 8/31/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import Foundation

struct ChatMessage
{
    let text: String
    let isInComing: Bool
    let date: Date
    
    init(text: String, isInComing: Bool, date: Date) {
        self.text = text
        self.isInComing = isInComing
        self.date = date
    }
}
