//
//  AppDelegate.swift
//  ChatAppGroupedAutoResizeingCellsDemo
//
//  Created by MacBook Pro on 8/26/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        return true
    }


}

