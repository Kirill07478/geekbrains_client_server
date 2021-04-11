//
//  GroupCell.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 17.03.2021.
//

import UIKit

@IBDesignable
class GroupCell: UITableViewCell {

    static let reuseId = "GroupCell"
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var avatarImage: UIImageView?
    
    func configure(group: Group) {
        
        titleLabel?.text = group.name
       
        if let image = group.image {
            avatarImage?.image = UIImage(systemName: image)
        } else {
            avatarImage?.image = UIImage(systemName: "folder.badge.person.crop.fill")
        }
        
    }
    
}
