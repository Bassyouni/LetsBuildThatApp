//
//  ViewController.swift
//  CADisplayLink
//
//  Created by MacBook Pro on 7/14/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "00000"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    
    var displayLink: CADisplayLink!
    
    var startValue: Double = 0
    let endValue: Double = 12442
    let animationDuration: Double = 5
    
    var animationStartDate = Date()
    
    let myString = "I come with no wrapping or pretty pink bows.I am who I am, from my head to my toes.I tend to get loud when speaking my mind.Even a little crazy some of the time."
    
    var splitedString: [String]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitedString = [String]()
        for char in myString
        {
            let x:String = String(char)
            splitedString.append(x)
        }
        
        
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
        displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ gesture:UITapGestureRecognizer)
    {
        displayLink.isPaused = false
        countingLabel.text = ""
        animationStartDate = Date()
        displayLink.add(to: .main, forMode: .defaultRunLoopMode)
    }
    
    //for numbers
    @objc func handleUpdate()
    {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)

        if elapsedTime > animationDuration
        {
            self.countingLabel.text = String(format: "%05.0f", endValue)
            displayLink.isPaused = true
        }
        else
        {
            let percentage = elapsedTime / animationDuration
            let value = startValue + percentage * (endValue - startValue)
            self.countingLabel.text = String(format: "%05.0f", value)
        }
    }
    
//    // for strings
//    var lastStringUsed = ""
//    var lastIndex = -1
//    @objc func handleUpdate()
//    {
//        let now = Date()
//        let elapsedTime = now.timeIntervalSince(animationStartDate)
//
//        if elapsedTime > animationDuration
//        {
//            self.countingLabel.text = myString
//            displayLink.isPaused = true
//        }
//        else
//        {
//            let percentage = elapsedTime / animationDuration
//            let value = startValue + percentage * Double(splitedString.count)
//
//            if lastStringUsed == splitedString[Int(floor(value))] && lastIndex == Int(floor(value))
//            {
//                return
//            }
//            self.countingLabel.text = self.countingLabel.text! + splitedString[Int(floor(value))]
//            lastStringUsed = splitedString[Int(floor(value))]
//            lastIndex = Int(floor(value))
//        }
//    }
    
    
    

}

