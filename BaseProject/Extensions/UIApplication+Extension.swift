//
//  UIApplication+Extension.swift
//  Base
//
//  Created by Özgün Ergen on 25.10.2021.
//

import Foundation
import UIKit

extension UIApplication {
    var visibleViewController: UIViewController? {
        
        guard var rootViewController = keyWindow?.rootViewController else {
            return nil
        }        
        return getVisibleViewController(rootViewController)
    }
    
    private func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
        
        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }
        
        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }
        
        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }
        
        return rootViewController
    }
}
