//
//  StateListTableViewController.swift
//  representativesWithAPI
//
//  Created by Kaden Hendrickson on 5/16/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List of States"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        let state = States.all[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRepresentativeVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? RepresentativeListTableViewController else {return}
                let state = States.all[indexPath.row]
                destinationVC.state = state
            }
        }
    }
}
