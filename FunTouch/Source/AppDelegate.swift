//
//  AppDelegate.swift
//  FunTouch
//
//  Created by Дмитрий on 09.12.2022.
//

import UIKit
import GoogleMobileAds


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //
    // MARK: - Constants
    //
    let tintColor =  UIColor(red: 242/255, green: 71/255, blue: 63/255, alpha: 1)

    //
    // MARK: - Variables And Properties
    //
    var backgroundSessionCompletionHandler: (() -> Void)?
    var window: UIWindow?

    //
    // MARK: - Application Delegate
    //
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
          customizeAppearance()
      return true
    }

    func application(_ application: UIApplication,
                     handleEventsForBackgroundURLSession handleEventsForBackgroundURLSessionidentifier: String,
                     completionHandler: @escaping () -> Void) {
      backgroundSessionCompletionHandler = completionHandler
    }

    //
    // MARK - Private Methods
    //
    private func customizeAppearance() {
      window?.tintColor = tintColor

      UISearchBar.appearance().barTintColor = tintColor

      UINavigationBar.appearance().barTintColor = tintColor
      UINavigationBar.appearance().tintColor = UIColor.white

      let titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.white]
      UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
    }

  }



