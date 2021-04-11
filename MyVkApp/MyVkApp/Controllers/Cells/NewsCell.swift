//
//  NewsCell.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 02.04.2021.
//

import UIKit

class NewsCell: UITableViewCell {

    static let reuseId = "NewsCell"
    
    @IBOutlet weak var writersName: UILabel!
    @IBOutlet weak var writersAvatar: AvatarView?
    @IBOutlet weak var timeOfCreation: UILabel!
    @IBOutlet weak var newsDescription: UILabel?
    @IBOutlet weak var newsImage: UIImageView?
    @IBOutlet weak var likeView: LikeView!
    
    func configure(news: News) {
        
        writersName.text = news.writer.fullName()
        timeOfCreation.text = news.timeOfCreation
        newsDescription?.text = news.descriptionNews
        newsDescription?.sizeToFit()
       
        if let avatar = news.writer.image {
            writersAvatar?.imageView.image = UIImage(named: avatar)
        } else {
            writersAvatar?.imageView.image = UIImage(systemName: "person.fill")
        }
        
        if let image = news.image {
            newsImage?.image = UIImage(named: image)
        } else {
            newsImage?.image = nil
        }
        
        
    }
    
}
