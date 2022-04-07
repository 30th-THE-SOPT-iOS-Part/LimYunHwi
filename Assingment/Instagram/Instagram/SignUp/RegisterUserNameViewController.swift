//
//  RegisterUserNameViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/05.
//

import UIKit

class RegisterUserNameViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureInputField()
    }

    private func configureView(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.nextButton.isUserInteractionEnabled = false
        self.nextButton.alpha = 0.5
    }
    
    private func configureInputField(){
        self.userNameTextField.addTarget(self, action: #selector(vaildNextButton), for: .editingChanged)
    }
    
    @objc private func vaildNextButton(){
        self.nextButton.isUserInteractionEnabled = !(self.userNameTextField.text?.isEmpty ?? true)
        self.nextButton.alpha = self.nextButton.isUserInteractionEnabled ? 1 : 0.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RegisterPasswordViewController" {
            guard let registerPasswordVC = segue.destination as? RegisterPasswordViewController else {return}
            guard let userName = userNameTextField.text else {return}
            user = User(userName: userName, password: "")

            registerPasswordVC.user = user
        }
    }
}
