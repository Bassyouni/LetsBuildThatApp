//
//  AppDelegate.swift
//  NoStoryBoardAllInCode
//
//  Created by MacBook Pro on 7/18/18.
//  Copyright © 2018 Bassyouni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.barTintColor = UIColor.orange
        navigationBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white ]
        
        application.statusBarStyle = .lightContent
        let questionVC = QuestionsVC()
        let navigationController = UINavigationController(rootViewController: questionVC)
        
        window?.rootViewController = navigationController
        
        
        return true
    }

}

