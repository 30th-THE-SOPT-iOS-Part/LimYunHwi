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
    
    //MARK: - Properties
    var passwordShownButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureInputField()
        self.configurePasswordShownButton()
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
    
    private func configurePasswordShownButton() {
        self.passwordShownButton = UIButton.init(primaryAction: UIAction(handler: {_ in
            self.passwordTextField.isSecureTextEntry.toggle()
            self.passwordShownButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        self.passwordShownButton.setImage(UIImage(named: "PasswordHiddenIcon"), for: .normal)
        self.passwordShownButton.setImage(UIImage(named: "PasswordShownIcon"), for: .selected)
        self.passwordShownButton.configuration = buttonConfiguration
        
        self.passwordTextField.rightView = passwordShownButton
        self.passwordTextField.rightViewMode = .always
    }
    
    private func createAlert(_ title: String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "??????", style: .default) { _ in
            let tabBarControllerStoryboard = UIStoryboard(name: "TabBarController", bundle: nil)
            guard let tabBarController = tabBarControllerStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {return}
            tabBarController.modalPresentationStyle = .fullScreen

            self.view.window?.replaceRootViewController(tabBarController, animated: true, completion: nil)
            self.view.window?.makeKeyAndVisible()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    //MARK: - Action
    @IBAction func tapSignInButton(_ sender: UIButton) {
        guard let email = self.userIdTextField.text else {return}
        guard let password = self.passwordTextField.text else {return}
        
        UserService.shared.signIn(name: nil, email: email, password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignInResponse else {return}
                UserInfo.shared.name = data.data?.name
                UserInfo.shared.email = data.data?.email
                self.createAlert("????????? ??????")
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
