//
//  ViewController.swift
//  Magical Grid
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ColoredCellView: UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: CGFloat(drand48()),
                                       green: CGFloat(drand48()),
                                       blue: CGFloat(drand48()),
                                       alpha: 1)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        // is must for hit testing
        self.isUserInteractionEnabled = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    let numberOfCellsInRow = 15
    
    var cells = [String: ColoredCellView]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = view.frame.width / CGFloat(numberOfCellsInRow)
        
        for i in 0...30
        {
            for j in 0...numberOfCellsInRow
            {
                let cellView = ColoredCellView()
                cellView.frame = CGRect(x: CGFloat(j) * width, y: CGFloat(i) * width, width: width, height: width)
                view.addSubview(cellView)
                let key = "\(j)/\(i)"
                cells[key] = cellView
                
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    var selectedCell: ColoredCellView?
    
    @objc func handlePan(gesture: UIPanGestureRecognizer)
    {
        let panLocation = gesture.location(in: view)
        
                    /* Using Hit Test Method */
        
//        let cellView = view.hitTest(panLocation, with: nil)
//
//        if let cellView = cellView as? ColoredCellView
//        {
//            if cellView != selectedCell
//            {
//                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                    self.selectedCell?.layer.transform = CATransform3DIdentity
//                })
//            }
//
//            selectedCell = cellView
//
//            view.bringSubview(toFront: cellView)
//
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
//            })
//
//            if gesture.state == .ended
//            {
//                UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
//                    cellView.layer.transform = CATransform3DIdentity
//                })
//            }
//        }
                    /* End of Using Hit Test Method */
        
                    /* Using Math Calculations Method */
        
        let width = view.frame.width / CGFloat(numberOfCellsInRow)

        let x = Int(panLocation.x / width)
        let y = Int(panLocation.y / width)

        let key = "\(x)/\(y)"
        guard let cellView = cells[key] else { return }
        
        if cellView != selectedCell
        {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.selectedCell?.layer.transform = CATransform3DIdentity
            })
        }
        
        selectedCell = cellView
        
        view.bringSubview(toFront: cellView)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
        })
        
        if gesture.state == .ended
        {
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                cellView.layer.transform = CATransform3DIdentity
            })
        }
        
                    /* End of Using Math Calculations Method */
        
        
        
    }
    
    
    override var prefersStatusBarHidden: Bool { return true }
    
    


}

