//
//  FriendsPhotosViewController.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 01.03.2021.
//

import UIKit


class FriendsPhotosViewController: UICollectionViewController {

    var photo: UIImage?
    var name: String = ""
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCell", for: indexPath) as! FriendsPhotoCell
        
        cell.friendsPhoto?.image = photo
        
        return cell
    }

}
