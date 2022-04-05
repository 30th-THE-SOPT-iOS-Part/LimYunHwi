//
//  RegisterUserNameViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/05.
//

import UIKit

class RegisterUserNameViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        self.configureView()
    }

    func configureView(){
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
    }
}
