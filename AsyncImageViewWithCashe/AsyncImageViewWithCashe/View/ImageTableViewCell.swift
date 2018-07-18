//
//  ImageTableViewCell.swift
//  AsyncImageViewWithCashe
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    var tempImageView: AsyncImageView = {
        let v = AsyncImageView()
        v.contentMode = .scaleAspectFit
        v.image = UIImage(named: "temp")
        return v
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(tempImageView)
        tempImageView.centerYAnchor.constraintEqualToSystemSpacingBelow(self.centerYAnchor, multiplier: 0).isActive = true
        tempImageView.centerXAnchor.constraintEqualToSystemSpacingAfter(self.centerXAnchor, multiplier: 0).isActive = true
        tempImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
