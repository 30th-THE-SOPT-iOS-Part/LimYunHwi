//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/05.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var stories: [User] = []
    static let identifier = "StoryTableViewCell"
    static func nib() -> UINib {
        UINib(nibName: "StoryTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.stories = User.sampleUser
        
        configureCollectionView()
    }
    
    private func configureCollectionView(){
        collectionView.register(StoryCollectionViewCell.nib(), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        self.collectionView.dataSource = self
    }
}

extension StoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return User.sampleUser.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell() }
        
        cell.configureCell(userName: stories[indexPath.row].userName, profileImage: stories[indexPath.row].profileImage ?? "")
        
        return cell
    }
}

extension StoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 6, bottom: 8, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
