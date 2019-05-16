//
//  RepresentativeTableViewCell.swift
//  representativesWithAPI
//
//  Created by Kaden Hendrickson on 5/16/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    func updateViews() {
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        linkLabel.text = representative?.link
        districtLabel.text = representative?.district
        phoneNumberLabel.text = representative?.phone
    }

}
