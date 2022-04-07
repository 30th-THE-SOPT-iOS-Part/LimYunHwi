//
//  ViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }

    func configureView(){
        self.loginButton.isUserInteractionEnabled = false
        self.loginButton.alpha = 0.5
    }
    
    @IBAction func editTextField(_ sender: UITextField) {
        self.loginButton.isUserInteractionEnabled = true
        self.loginButton.alpha = 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompleteSignUpViewController" {
            guard let completeSignUpVC = segue.destination as? CompleteSignUpViewController else {return}
            guard let userId = self.userIdTextField.text else {return}
            guard let password = self.passwordTextField.text else {return}
            user = User(userName: userId, password: password)
            
            completeSignUpVC.user = user
        }
    }
}

