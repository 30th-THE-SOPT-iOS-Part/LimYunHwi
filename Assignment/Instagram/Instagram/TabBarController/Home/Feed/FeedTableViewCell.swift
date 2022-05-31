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
    @IBOutlet weak var likeButton: UIButton!
    
    static let identifier = "FeedTableViewCell"
    static func nib() -> UINib {
        UINib(nibName: "FeedTableViewCell", bundle: nil)
    }
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ user: User) {
        self.likeButton.setImage(UIImage(named: "icn_unlike"), for: .normal)
        self.likeButton.setImage(UIImage(named: "icn_like"), for: .selected)
        
        guard let profileImage = user.profileImage else {return}
        guard let post = user.post else {return}
        
        self.userNameLabel.text = user.userName
        self.contentUserNameLabel.text = user.userName
        self.profileImage.image = UIImage(named: profileImage)
        self.likeLabel.text = "좋아요 \(post.numberOfLike)개"
        self.contentLabel.text = post.content
        self.commentButton.setTitle("댓글 \(post.comments.count)개 모두 보기", for: .normal)
        self.likeButton.isSelected = post.like
        
        requestURLImage()
    }
    
    private func requestURLImage() {
        UnsplashService.shared.getRandomPhotos(count: 1) { [weak self] result in
            switch result {
            case .success(let data):
                guard let data = data as? [RandomPhotosResponse] else {return}
                guard let downloadURL = data.first?.links.download else {return}
                self?.confidureImagefromURL(downloadURL)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkErr")
            }
        }
    }
    
    private func confidureImagefromURL(_ url: String) {
        guard let url = URL(string: url) else {return}
        
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url) else {return}
            
            DispatchQueue.main.async {
                self?.contentImage.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func tapLikeButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: NotificationName.like, object: ["index" : self.index])
    }
}
