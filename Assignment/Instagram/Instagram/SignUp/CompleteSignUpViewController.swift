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
        //Error
//        guard let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
//        homeViewController.modalPresentationStyle = .fullScreen
//
//        self.present(homeViewController, animated: true, completion: nil)
    }
    
    @IBAction func tapSignInOtherAccountButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
