//
//  SceneDelegate.swift
//  GetItDone
//
//  Created by Alberto Dominguez on 3/28/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Create and set the window to be the same size as the screen
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)

        // Create an instance of the main view controller and a navigation controller
        
        // if user's first time, present WelcomeVC(),
        // else presetn ListVC()
        let store = UserDefaultManager()
        var vc: UIViewController
        
        if store.userIsRegistered {
            vc = ListVC()
        } else {
            vc = WelcomeVC()
        }
        
//        let vc = WelcomeVC()
        //let navigationController = UINavigationController(rootViewController: vc)

        // Tell the window to load the navigation controller as it's root view
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
        
        for family in UIFont.familyNames.sorted(){
            let names = UIFont.fontNames(forFamilyName: family)
            //print("family: \(family), name: \(names)")
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

