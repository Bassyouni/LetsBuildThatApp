//
//  CongratulationsVC.swift
//  NoStoryBoardAllInCode
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class CongratulationsVC: UIViewController {
    
    let congratsLabel: UILabel = {
        let tempLbl = UILabel()
        tempLbl.text = "Congratulations You Made it In Code :D"
        tempLbl.font = UIFont.boldSystemFont(ofSize: 15)
        tempLbl.translatesAutoresizingMaskIntoConstraints = false
        tempLbl.numberOfLines = 0
        tempLbl.textAlignment = .center
        tempLbl.textColor = UIColor.orange
        return tempLbl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        self.title = "Code Baby"
        
        if let topItem = self.navigationController?.navigationBar.topItem
        {
            topItem.backBarButtonItem = UIBarButtonItem(title: "" , style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        view.addSubview(congratsLabel)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label": congratsLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["label": congratsLabel]))

       
    }


}
