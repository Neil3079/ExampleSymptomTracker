//
//  SceneDelegate.swift
//  COVID-19SymptonTracker
//
//  Created by Neil Horton on 03/04/2020.
//  Copyright © 2020 theappbusiness. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let symptomTrackerVC = SymptomTrackerViewController(storeManager: CareStoreReferenceManager.shared.synchronizedStoreManager)
        let careViewController = UINavigationController(rootViewController: symptomTrackerVC)

        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = careViewController
            window?.tintColor = UIColor { $0.userInterfaceStyle == .light ? #colorLiteral(red: 0.5258278251, green: 0.3821768165, blue: 0.7851777673, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
            window?.makeKeyAndVisible()
        }
    }
}

