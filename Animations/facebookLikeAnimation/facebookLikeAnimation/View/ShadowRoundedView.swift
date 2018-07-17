//
//  ShadowRoundedView.swift
//  facebookLikeAnimation
//
//  Created by MacBook Pro on 7/17/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ShadowRoundedView: UIView {

    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.75
        self.layer.cornerRadius = self.frame.width / 2
    }
}
