//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/06.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageViewCustom!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var contentUserNameLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var contentImage: UIImageView!
    
    static let identifier = "FeedTableViewCell"
    static func nib() -> UINib {
        UINib(nibName: "FeedTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ user: User) {
        guard let profileImage = user.profileImage else {return}
        guard let post = user.post else {return}
        
        self.userNameLabel.text = user.userName
        self.contentUserNameLabel.text = user.userName
        self.profileImage.image = UIImage(named: profileImage)
        self.likeLabel.text = "좋아요 \(post.like)개"
        self.contentLabel.text = post.content
        self.commentButton.setTitle("댓글 \(post.comments.count)개 모두 보기", for: .normal)
        self.contentImage.image = UIImage(named: post.image)
    }
}
