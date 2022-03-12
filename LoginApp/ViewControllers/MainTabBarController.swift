//
//  MainTabBarController.swift
//  LoginApp
//
//  Created by Iliya Mayasov on 12.03.2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    var name = ""
    var surname = ""
    var hobby = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let viewController = viewController as? WelcomeViewController {
                viewController.user = name
            }
            
            if let userNavigationVC = viewController as? UserNavigationViewController {
                if let userVC = userNavigationVC.viewControllers.first as? UserViewController {
                    userVC.name = name
                    userVC.surname = surname
                    userVC.hobby = hobby
                }
            }
            
        }
    }
} 
