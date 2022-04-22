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
    let keyWindow = UIApplication
            .shared
            .connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    
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
        let tabBarControllerStoryboard = UIStoryboard(name: "TabBarController", bundle: nil)
        guard let tabBarController = tabBarControllerStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {return}
        tabBarController.modalPresentationStyle = .fullScreen

        self.present(tabBarController, animated: true) {
            self.keyWindow?.replaceRootViewController(tabBarController, animated: true, completion: nil)
        }
    }
    
    @IBAction func tapSignInOtherAccountButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
