//
//  DelegateViewController.swift
//  3rd_seminar
//
//  Created by limyunhwi on 2022/04/23.
//

import UIKit

class DelegateViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
    
    @IBAction func tapNextButton(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        
        secondViewController.delegate = self
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension DelegateViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작되었습니다.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return 버튼이 눌렸어요!")
        textField.endEditing(true)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 끝났습니다.")
    }
}

extension DelegateViewController: SecondViewControllerDelegate {
    func sendData(data: String) {
        dataLabel.text = data
    }
}
