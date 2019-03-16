//
//  AppDelegate.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/20/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        /* PART 1 START */
        
        let center =  UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound])
        { (granted, error) in
            let content = UNMutableNotificationContent()
            content.title = "Hey Bitch"
            content.subtitle = "Open me"
            content.body = "i hate coding"
            content.sound = UNNotificationSound.default()
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5.0, repeats: false)
            let request = UNNotificationRequest(identifier: "ContentIdentifier", content: content, trigger: trigger)
            center.add(request) { (error) in
                if error != nil {
                    print("error \(String(describing: error))")
                }
            }
        }

        
        
        /* PART 1 FINISH */
    }
}

