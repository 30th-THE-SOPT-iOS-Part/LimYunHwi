//
//  CompleteSignUpViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/06.
//

import UIKit

class CompleteSignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapDoneButton(_ sender: UIButton) {
        let presentingVC = self.presentingViewController!
        if presentingVC is UINavigationController {
            let navigationController = presentingVC as? UINavigationController
            navigationController?.popToRootViewController(animated: false)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
