//
//  MusicTableViewCell.swift
//  3rd_seminar
//
//  Created by limyunhwi on 2022/04/23.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    static let identifier = "MusicTableViewCell"
    
    @IBOutlet weak var albumCoverImage: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicDescriptionLabel: UILabel!
    @IBOutlet weak var moveButton: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setData(_ musicData: MusicDataModel) {
            albumCoverImage.image = musicData.albumImage
            musicTitleLabel.text = musicData.musicTitle
            musicDescriptionLabel.text = musicData.description
        }
}
