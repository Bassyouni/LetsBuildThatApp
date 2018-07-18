//
//  QuestionTableViewCell.swift
//  NoStoryBoardAllInCode
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    let questionLabel:UILabel = {
        let temp = UILabel()
        temp.text = "What Question?"
        temp.font = UIFont.systemFont(ofSize: 14)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()
    {
        self.addSubview(questionLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": questionLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": questionLabel]))
    }
    
}
