//
//  RegisterPasswordViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/05.
//

import UIKit

class RegisterPasswordViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureInputField()
    }
    
    private func configureView(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.nextButton.isUserInteractionEnabled = false
        self.nextButton.alpha = 0.5
    }
    
    private func configureInputField(){
        self.passwordTextField.addTarget(self, action: #selector(vaildInputField), for: .editingChanged)
    }
    
    @objc private func vaildInputField(){
        self.nextButton.isUserInteractionEnabled = !(self.passwordTextField.text?.isEmpty ?? true)
        self.nextButton.alpha = self.nextButton.isUserInteractionEnabled ? 1 : 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompleteSignUpViewController" {
            guard let completeSignUpVC = segue.destination as? CompleteSignUpViewController else {return}
            guard let password = self.passwordTextField.text else {return}
            guard var user = user else {return}
            user.password = password
            
            completeSignUpVC.user = user
        }
    }
}
