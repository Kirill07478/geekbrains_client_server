//
//  FriendsViewController.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 28.02.2021.
//

import UIKit

class FriendsViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
    }

    // MARK: - DataSource
    
    var friends: [Friend] = Friend.allFriends()
    var filteredFriends: [Friend] = []
    var sections: [String] = []
    var cashedSectionItems: [String:[Friend]] = [:]
    
    private func filterFriends (text: String?) {
        guard let text = text, !text.isEmpty else {
            filteredFriends = friends
            return
        }
        
        filteredFriends = friends.filter {
            $0.fullName().lowercased().contains(text.lowercased())
        }
    }
    
    private func setupDataSource() {
        
        filterFriends(text: searchBar.text)
        
        let firstLetter = filteredFriends.map {String($0.surname.uppercased().prefix(1))}
        sections = Array(Set(firstLetter)).sorted()
        
        cashedSectionItems = [:]
        for section in sections {
            cashedSectionItems[section] = filteredFriends.filter {
                $0.surname.uppercased().prefix(1) == section
                
            }
        }
    }
    
    private func getFriend (for indexPath: IndexPath) -> Friend {
        let sectionLetter = sections[indexPath.section]
        return cashedSectionItems[sectionLetter]![indexPath.row]
    }
    
    // MARK: - Table view
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionLetter = sections[section]
        return (cashedSectionItems[sectionLetter] ?? []).count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = getFriend(for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        
        cell.configureCell(friend: friend)
        
        return cell
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FriendsPhotosViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let friend = getFriend(for: indexPath)
            controller.name = friend.fullName()
            
            if let image = friend.image {
                controller.photo = UIImage(named: image)
            } else {
                controller.photo = UIImage(named: "person.fill")
            }
            
        }
    }
    
    // MARK: - Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        setupDataSource()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print ("Заработало")
        searchBar.resignFirstResponder()
    }
}
