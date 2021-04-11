//
//  NewsViewController.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 02.04.2021.
//

import UIKit

class NewsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let cellNib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: NewsCell.reuseId)
        
    }

    // MARK: - Data source
    var news = News.allNews()
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell
        cell.configure(news: news[indexPath.row])
        
        return cell
    }

}
