//
//  MyGroupsViewController.swift
//  MyVkApp
//
//  Created by Kiryusha Orlov on 01.03.2021.
//

import UIKit

class MyGroupsViewController: UITableViewController {

    var myGroups: [Group] = []
    var selectedGroup: Group? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "GroupCell", bundle: nil),
                           forCellReuseIdentifier: GroupCell.reuseId)
                
    }
    
    
    //MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SearchGroupViewController {
            controller.myGroups = myGroups
        }
    }
    
    @IBAction func unwindSegueFromSearchGroup (_ sender: UIStoryboardSegue) {
        guard let controller = sender.source as? SearchGroupViewController,
              let indexPath = controller.tableView.indexPathForSelectedRow
        else { return }

        let group = controller.searchGroups[indexPath.item]

        removeRepetitions(group: group)

    }

    // MARK: - Table view
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseId, for: indexPath) as! GroupCell
        
        cell.configure(group: myGroups[indexPath.item])
        
        return cell
    }

// MARK: - Remove groups
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
//MARK: - Filter groups
    func removeRepetitions (group: Group) {
        var i = 0
        for myGroup in myGroups {
            if myGroup.name == group.name {
                i += 1
//                break
            }
        }
        
        if i == 0 {
            self.myGroups.append(group)
            self.tableView.reloadData()
            print(myGroups)
        }
    }
}
