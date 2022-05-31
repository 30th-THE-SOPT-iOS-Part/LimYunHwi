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
    
    private func createAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default){ _ in
            self.dismiss(animated: true)
        }
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    //MARK: - Action
    @IBAction func tapDoneButton(_ sender: UIButton) {
        guard let user = user else {return}
        
        UserService.shared.signUp(name: user.userName,
                                  email: user.userName,
                                  password: user.password){ response in
            switch response {
            case .success(_):
                self.createAlert("회원가입 성공")
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("neworkErr")
            }
        }
    }
    
    @IBAction func tapSignInOtherAccountButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
