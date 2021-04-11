//
//  SearchGroupViewController.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 01.03.2021.
//

import UIKit

class SearchGroupViewController: UITableViewController {
    
    
    var myGroups: [Group] = []
    
    var searchGroups: [Group] = Group.allGroups()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "GroupCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: GroupCell.reuseId)
        
    }

    // MARK: - Table view
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchGroups = filterGroups()
        return searchGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseId, for: indexPath) as! GroupCell
        cell.configure(group: searchGroups[indexPath.item])
        
        return cell
    }
    
// MARK: - Filter Groups
    func filterGroups() -> [Group] {
        var tmp = Group.allGroups()
        var i = 0
        for group in tmp {
            for myGroup in myGroups {
                if group.name == myGroup.name {
                    tmp.remove(at: i)
                    i -= 1
                }
            }
            i += 1
        }
        return tmp
    }
    
// MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "UnwindSegueToMyGroups", sender: nil)

    }

}
