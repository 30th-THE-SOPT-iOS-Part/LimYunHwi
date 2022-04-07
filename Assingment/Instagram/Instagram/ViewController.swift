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
        
        self.configureInputField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.configureView()
    }
    
    private func configureView(){
        self.userIdTextField.text = ""
        self.passwordTextField.text = ""
        
        self.loginButton.isUserInteractionEnabled = false
        self.loginButton.alpha = 0.5
    }
    
    private func configureInputField() {
        self.userIdTextField.addTarget(self, action: #selector(vaildLoginButton), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(vaildLoginButton), for: .editingChanged)
    }
    
    @objc private func vaildLoginButton() {
        self.loginButton.isUserInteractionEnabled = !(self.userIdTextField.text?.isEmpty ?? true) && !(self.passwordTextField.text?.isEmpty ?? true)
        
        self.loginButton.alpha = self.loginButton.isUserInteractionEnabled ? 1 : 0.5
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

