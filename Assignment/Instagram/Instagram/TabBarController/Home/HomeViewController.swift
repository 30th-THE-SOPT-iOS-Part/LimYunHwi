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
        tableView.register(FeedTableViewCell.nib(), forCellReuseIdentifier: FeedTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier) as? FeedTableViewCell else {return UITableViewCell()}
        
        cell.configureCell(feeds[indexPath.row])
        
        return cell
    }
}
