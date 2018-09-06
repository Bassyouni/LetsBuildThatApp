//
//  DateHeaderLabel.swift
//  ChatAppGroupedAutoResizeingCellsDemo
//
//  Created by MacBook Pro on 9/6/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
        textColor = .white
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize
    {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true // to activate
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
}
