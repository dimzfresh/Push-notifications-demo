//
//  AppDelegate.swift
//  PushNotificationDemo
//
//  Created by Dmitrii Ziablikov on 26.03.2018.
//  Copyright © 2018 Dmitrii Ziablikov. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        registerForPushNotifications(application: application)
        
        // Check if launched from notification
        if let notification = launchOptions?[UIApplicationLaunchOptionsKey.remoteNotification] as? [String: AnyObject] {
            let _ = notification["aps"] as! [String: AnyObject]
        }
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("token: \(token)")
        
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("failed to register for remote notifications with with error: \(error)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        let _ = userInfo["aps"] as! [String : Any]

    }
    
    func registerForPushNotifications(application: UIApplication) {
        
        //        let viewAction = UIMutableUserNotificationAction()
        //        viewAction.identifier = "VIEW_IDENTIFIER"
        //        viewAction.title = "View"
        //        viewAction.activationMode = .foreground
        //
        //        let newsCategory = UIMutableUserNotificationCategory()
        //        newsCategory.identifier = "NEWS_CATEGORY"
        //        newsCategory.setActions([viewAction], for: .default)
        
        // Check if you have permission to use notifications.
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
            print("granted: (\(granted)")
        }
        application.registerForRemoteNotifications()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

