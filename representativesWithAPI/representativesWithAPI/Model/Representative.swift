//
//  Representative.swift
//  representativesWithAPI
//
//  Created by Kaden Hendrickson on 5/16/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation

struct TopLevelRepresentative: Decodable{
    let results: [Representative]
}

struct Representative: Decodable {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
