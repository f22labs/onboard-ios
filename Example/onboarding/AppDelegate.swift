//
//  AppDelegate.swift
//  onboarding
//
//  Created by ranjithatF22Labs on 11/07/2016.
//  Copyright (c) 2016 ranjithatF22Labs. All rights reserved.
//

import UIKit
import onboarding

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,F22InstructorSceneProtocol {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if(self.window == nil) {
            self.window = UIWindow()
        }
        var dictionary = [Dictionary<String,String>]()
           dictionary = [["image":"illustrationScreen-1",
         "title":"SIMPLE ABROAD CALLS",
         "subTitle":"Wonep converts international calls to local calls"],
         ["image":"illustrationScreen-2",
         "title":"FREE WONEP TO WONEP",
         "subTitle":"if the person you're calling also has Wonep the call will be entirely free"],
         ["image":"iIllustrationScreen-3",
         "title":"NO HIDDEN CHARGES OR FEES",
         "subTitle":"We have a very small charge for non-Wonep calls to mobiles or landlines"]]
        
        let loginViewController = LoginViewController()
        
        let instructorVC = F22InstructorScene.init(inputViews: dictionary, nextViewController:loginViewController,hideStatusBar:true)
        
        let navigationController = UINavigationController.init(rootViewController: instructorVC)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
        self.window?.makeKeyAndVisible()
        return true
    }
    
  
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    //MARK:: F22InstructorSceneProtocol functions
    func didFinishInstructions() {}

}

