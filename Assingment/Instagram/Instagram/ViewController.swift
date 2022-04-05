//
//  ViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }

    func configureView(){
        loginButton.isUserInteractionEnabled = false
        loginButton.alpha = 0.5
    }

}

