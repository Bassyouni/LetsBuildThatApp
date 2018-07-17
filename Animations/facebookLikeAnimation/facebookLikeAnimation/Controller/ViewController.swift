//
//  ViewController.swift
//  facebookLikeAnimation
//
//  Created by MacBook Pro on 7/17/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bkImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "fb_core_data_bg"))
        return imageView
    }()
    
    let iconsContainorView: UIView = {
        let containorView = UIView()
        containorView.backgroundColor = UIColor.white
        
        
        //configratuion
        let iconHeight: CGFloat = 38
        let padding: CGFloat = 6
        
        let images = [#imageLiteral(resourceName: "blue_like"), #imageLiteral(resourceName: "red_heart"), #imageLiteral(resourceName: "cry_laugh"), #imageLiteral(resourceName: "surprised"), #imageLiteral(resourceName: "cry"), #imageLiteral(resourceName: "angry")]
        
        let arrangedSubviews = images.map({ (image) -> UIImageView in
            let tempView = UIImageView(image: image)
            tempView.layer.cornerRadius = iconHeight / 2
            //required for hit testing
            tempView.isUserInteractionEnabled = true
            return tempView
        })
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        
        
        stackView.spacing = padding
        
        stackView.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        containorView.addSubview(stackView)
        
        let numOfIcons = CGFloat(arrangedSubviews.count)
        let width = iconHeight * numOfIcons + (numOfIcons + 1) * padding
        
        containorView.frame = CGRect(x: 0, y: 0, width: width, height: iconHeight + 2 * padding)
        containorView.layer.cornerRadius = containorView.frame.height / 2
        
        //shadow
        containorView.layer.shadowColor = UIColor.darkGray.cgColor
        containorView.layer.shadowRadius = 15
        containorView.layer.shadowOpacity = 0.75
        
        stackView.frame = containorView.frame
        
        return containorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bkImageView)
        bkImageView.frame = view.frame
        
        setupLongPressGesture()
    }
    
    fileprivate func setupLongPressGesture()
    {
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:))))
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer)
    {
        if gesture.state == .began
        {
            handleLongPressBegan(gesture: gesture)
        } 
        else if gesture.state == .ended
        {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                let stackView = self.iconsContainorView.subviews.first
                stackView?.subviews.forEach({ (imageView) in
                    imageView.transform = .identity
                })
                self.iconsContainorView.transform = self.iconsContainorView.transform.translatedBy(x: 0, y: 50)
                self.iconsContainorView.alpha = 0
                
            }) { (_) in
                self.iconsContainorView.removeFromSuperview()
            }
            
        }
        else if gesture.state == .changed
        {
            handleLongPressChanged(gesture: gesture)
        }
    }
    
    fileprivate func handleLongPressChanged(gesture: UILongPressGestureRecognizer)
    {
        let pressedLoaction = gesture.location(in: iconsContainorView)
        
        let fixedYLoaction = CGPoint(x: pressedLoaction.x, y: self.iconsContainorView.frame.height / 2)
        print(fixedYLoaction)
        
        let hitTestView = iconsContainorView.hitTest(fixedYLoaction, with: nil)
        
        if hitTestView is UIImageView
        {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                let stackView = self.iconsContainorView.subviews.first
                stackView?.subviews.forEach({ (imageView) in
                    imageView.transform = .identity
                })
                
                hitTestView?.transform = CGAffineTransform(translationX: 0, y: -50)
                
            })
        }
    }
    
    fileprivate func handleLongPressBegan(gesture: UILongPressGestureRecognizer)
    {
        view.addSubview(iconsContainorView)
        
        let pressedLocation = gesture.location(in: self.view)
        let centerX = (view.frame.width - iconsContainorView.frame.width) / 2
        
        
        
        //animation part
        iconsContainorView.alpha = 0
        iconsContainorView.transform = CGAffineTransform(translationX: centerX, y: pressedLocation.y)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.iconsContainorView.alpha = 1
            self.iconsContainorView.transform = CGAffineTransform(translationX: centerX, y: pressedLocation.y - (self.iconsContainorView.frame.height + 50 ))
            
        })
    }
    
    override var prefersStatusBarHidden: Bool { return true }


}

