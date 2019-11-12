//
//  SceneDelegate.swift
//  iTag
//
//  Created by Leo Vergnetti on 11/1/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        let tabController = UITabBarController()
        
        let highlightStoryboard = UIStoryboard(name:"Highlight", bundle: nil)
        
        let documentsStoryboard = UIStoryboard(name:"Documents", bundle: nil)
                 
        let labelsStoryboard = UIStoryboard(name: "Labels", bundle: nil)
        
        let documentsVC = documentsStoryboard.instantiateViewController(withIdentifier: "Documents") as! DocumentsViewController
        
        let highlightVC = highlightStoryboard.instantiateViewController(withIdentifier: "Highlight") as! HighlightViewController
        
        let labelsVC = labelsStoryboard.instantiateViewController(withIdentifier: "Labels") as! LabelsViewController
        let vcData : [(UIViewController, UIImage, UIImage)] = [
            
            (highlightVC, UIImage(named: "highlightIcon")!, UIImage(named: "highlightSelectedIcon")!),
            
             (documentsVC, UIImage(named: "documentIcon")!, UIImage(named: "documentSelectedIcon")!),
             
             (labelsVC, UIImage(named: "labelIcon")!, UIImage(named: "labelSelectedIcon")!)
             
        ]
        
        let vcs = vcData.map{ (vc, defaultImage, selectedImage) -> UINavigationController in
            
            let nav = UINavigationController(rootViewController: vc)
           
            nav.tabBarItem.image = defaultImage
            
            nav.tabBarItem.selectedImage = selectedImage
            
            return nav
            
        }
        
        tabController.viewControllers = vcs
        
        tabController.tabBar.isTranslucent = false
        
        if let items = tabController.tabBar.items {
            for item in items {
                
                if let image = item.image {
                    
                    item.image = image.withRenderingMode(.alwaysOriginal)
                    
                }
                if let selectedImage = item.selectedImage {
                    
                    item.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
                    
                }
                
                item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
        
        UINavigationBar.appearance().backgroundColor = UIColor.white
        
        window?.rootViewController = tabController
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
    }


}

