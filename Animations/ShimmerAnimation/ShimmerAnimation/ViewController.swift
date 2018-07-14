//
//  ViewController.swift
//  ShimmerAnimation
//
//  Created by MacBook Pro on 7/14/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        //darker text label in the back
        let darkTextLabel = UILabel()
        darkTextLabel.text = "SHIMMER"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        darkTextLabel.textAlignment = .center
        
        view.addSubview(darkTextLabel)
        
        //shiny text label on front
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "SHIMMER"
        shinyTextLabel.textColor = UIColor.white
        shinyTextLabel.font = UIFont.systemFont(ofSize: 80)
        shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        shinyTextLabel.textAlignment = .center
        
        view.addSubview(shinyTextLabel)
        
        // gradientLayer
        let gradientLayer = CAGradientLayer()
        //cg color is a must
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinyTextLabel.frame
        
        let angle = -60 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        shinyTextLabel.layer.mask = gradientLayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2.3
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(animation, forKey: "dosent Matter What's The key For Now")
        
        //for testing to see it
//        view.layer.addSublayer(gradientLayer)

    }
}

