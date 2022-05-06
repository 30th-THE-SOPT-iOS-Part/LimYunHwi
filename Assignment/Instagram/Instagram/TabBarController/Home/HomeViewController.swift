//
//  HomeViewController.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/17.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var feeds: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feeds = User.sampleUser
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(StoryTableViewCell.nib(), forCellReuseIdentifier: StoryTableViewCell.identifier)
        tableView.register(FeedTableViewCell.nib(), forCellReuseIdentifier: FeedTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return feeds.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier) as? StoryTableViewCell else {return UITableViewCell()}
            return cell
        case 1:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier) as? FeedTableViewCell else {return UITableViewCell()}
            cell.configureCell(feeds[indexPath.row])
            return cell
        default :
            return UITableViewCell()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width
        if indexPath.section == 0 {
            return width * (72/375)
        }
        return width * (535.5/375)
    }
}
