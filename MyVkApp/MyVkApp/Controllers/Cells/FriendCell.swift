//
//  FriendCell.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 01.03.2021.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var avatarView: AvatarView?
    
    
    func configureCell(friend: Friend){
        nameLabel?.text = friend.fullName()
        if let image = friend.image {
            avatarView?.imageView.image = UIImage(named: image)
        } else {
            avatarView?.imageView.image = UIImage(named: "person.fill")
        }

    }
}
