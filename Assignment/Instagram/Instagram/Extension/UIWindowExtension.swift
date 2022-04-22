//
//  UIWindowExtension.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/22.
//

import UIKit

extension UIWindow {
    func replaceRootViewController(_ viewController : UIViewController, animated: Bool, completion: (()-> Void)? ){
        let snapShotImageview = UIImageView(image: self.snapShot())
        self.addSubview(snapShotImageview)
        
        let dismissCompletion = {() -> Void in
            self.rootViewController = viewController
            self.bringSubviewToFront(snapShotImageview)
            
            if animated {
                UIView.animate(
                    withDuration: 0.4,
                    animations: { () -> Void in
                        snapShotImageview.alpha = 0
                    },
                    completion: { (success) -> Void in
                        snapShotImageview.removeFromSuperview()
                        guard let completion = completion else {return}
                        completion()

                    })
            } else {
                snapShotImageview.removeFromSuperview()
                guard let completion = completion else {return}
                completion()
            }
        }
        
        if self.rootViewController!.presentedViewController != nil {
            self.rootViewController?.dismiss(animated: true, completion: dismissCompletion)
        } else {
            dismissCompletion()
        }
    }
    
    func snapShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else {return UIImage.init()}
        UIGraphicsEndImageContext()
        
        return result
    }
}
