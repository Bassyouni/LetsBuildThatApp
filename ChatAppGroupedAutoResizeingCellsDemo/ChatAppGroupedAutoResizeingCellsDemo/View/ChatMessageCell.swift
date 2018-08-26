//
//  ChatMessageCell.swift
//  ChatAppGroupedAutoResizeingCellsDemo
//
//  Created by MacBook Pro on 8/26/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "This is rather a long text , that need resizing to work better . it will probably take about two or three rows."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(wrapperView)
        addSubview(messageLabel)

//        messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        // constraints
        let constraints = [
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
        messageLabel.widthAnchor.constraint(equalToConstant: 250),
        
        wrapperView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
        wrapperView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
        wrapperView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
        wrapperView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16) ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
