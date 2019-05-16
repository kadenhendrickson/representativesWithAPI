//
//  RepresentativeListTableViewController.swift
//  representativesWithAPI
//
//  Created by Kaden Hendrickson on 5/16/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class RepresentativeListTableViewController: UITableViewController {

    var state: String?
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let state = state else {return}
        title = "List of Representatives in \(state)"

        RepresentativeController.fetchRepresentative(state: state) { (representative) in
            self.representatives = representative
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell
        
        cell?.representative = representatives[indexPath.row]
        

        return cell ?? UITableViewCell()
    }
    
}
