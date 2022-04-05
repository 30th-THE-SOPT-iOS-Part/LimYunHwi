//
//  RegisterPasswordViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/05.
//

import UIKit

class RegisterPasswordViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }
    
    func configureView(){
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
    }
}
