//
//  UserSettingsViewController.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 11.04.2021.
//

import UIKit

class UserSettingsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var tokenLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let session = Session.instance
        nameLabel.text = session.name
        idLabel.text = String(describing: session.id)
        tokenLabel.text = session.token
    }


}
