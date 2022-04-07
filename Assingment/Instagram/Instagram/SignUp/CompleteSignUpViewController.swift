//
//  CompleteSignUpViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/06.
//

import UIKit

class CompleteSignUpViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView(){
        if let user = user {
            self.welcomeLabel.text = "\(user.userName)님 Instagram에 오신 것을 환영합니다."
        }
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
