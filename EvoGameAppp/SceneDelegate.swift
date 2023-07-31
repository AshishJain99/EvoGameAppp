//
//  SceneDelegate.swift
//  EvoGameAppp
//
//  Created by sixpep on 20/03/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // This will be your window instance from now on.
        let window = UIWindow(windowScene: windowScene)
        
        // Get a reference to the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the new initial view controller (use your own view controller ID)

        if UserDefaults.standard.bool(forKey: "secTime"){
            
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
//            UserDefaults.standard.set(false, forKey: "secTime")
            let navigationController = UINavigationController(rootViewController: initialViewController!)
                    
            // Set the new initial view controller as the window's root view controller
            window.rootViewController = navigationController
        }else{
            
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "firstOnboardinViewController") as? firstOnboardinViewController
            UserDefaults.standard.set(true, forKey: "secTime")
            let navigationController = UINavigationController(rootViewController: initialViewController!)
                    
            // Set the new initial view controller as the window's root view controller
            window.rootViewController = navigationController
            
            
            
            
            
            
        }
        
        
        
        
        // Set the window and make it visible
        self.window = window
        window.makeKeyAndVisible()
    }


    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

