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
        super.viewDidLoad()
        
        self.configureView()
    }

    func configureView(){
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
    }
}
