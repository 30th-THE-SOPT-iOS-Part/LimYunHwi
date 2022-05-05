//
//  UIImageViewExtension.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/05.
//

import UIKit

class UIImageViewCustom: UIImageView {
    @IBInspectable var isRound: Bool = false {
        didSet {
            self.layer.cornerRadius = self.frame.height / 2
        }
    }
}
