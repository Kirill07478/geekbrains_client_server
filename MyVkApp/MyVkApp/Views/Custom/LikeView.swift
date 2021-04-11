//
//  LikeView.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 02.04.2021.
//

import UIKit

@IBDesignable
class LikeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    var likeOrNot: Bool = false
   
    @IBOutlet weak var likeLabel: UILabel!
    @IBAction func likeTouched(_ sender: Any) {
        if likeOrNot == true {
            doUnlike()
        } else {
            doLike()
        }
        
        likeOrNot = !likeOrNot
    }
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBAction func commentTouched(_ sender: Any) {
        print (#function)
    }
    
    
    func setup() {
        
        Bundle.main.loadNibNamed("LikeView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func prepareForInterfaceBuilder() {
        print (#function)
        }
    
    func doLike() {
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.tintColor = UIColor.red
        
        if let amountofLikes = Int(likeLabel.text!) {
            likeLabel.text = "\(amountofLikes + 1)"
        }
    }
    
    func doUnlike() {
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = UIColor.gray
        
        if let amountofLikes = Int(likeLabel.text!) {
            likeLabel.text = "\(amountofLikes - 1)"
        }
    }
}
