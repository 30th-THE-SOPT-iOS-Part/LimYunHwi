//
//  TabBarController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/19.
//

import UIKit

class TabBarController: UITabBarController {
    var modeStyle: UIUserInterfaceStyle = .light {
        didSet{
            self.overrideUserInterfaceStyle = modeStyle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let reelsViewController = viewController as? ReelsViewController {
            modeStyle = .dark
        } else {
            modeStyle = .light
        }
    }
}
