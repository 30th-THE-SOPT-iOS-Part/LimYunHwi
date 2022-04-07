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
    }

    func configureView(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.nextButton.isUserInteractionEnabled = false
        self.nextButton.alpha = 0.5
    }
    
    @IBAction func EditUserName(_ sender: UITextField) {
        self.nextButton.isUserInteractionEnabled = true
        self.nextButton.alpha = 1
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
