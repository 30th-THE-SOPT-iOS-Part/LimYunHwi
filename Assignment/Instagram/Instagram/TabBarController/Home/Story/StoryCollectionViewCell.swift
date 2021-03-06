//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/05.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    static let identifier = "StoryCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: "StoryCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(userName: String, profileImage: String) {
        self.profileImage.image = UIImage(named: profileImage)
        self.userName.text = userName
    }
}
