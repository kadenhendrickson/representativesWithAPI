//
//  RepresentativeController.swift
//  representativesWithAPI
//
//  Created by Kaden Hendrickson on 5/16/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = URL(string: "https://whoismyrepresentative.com")
    
    static func fetchRepresentative(state: String, completion: @escaping ([Representative]) -> Void) {
        guard var url = baseURL else {completion([]); return}
        url.appendPathComponent("getall_reps_bystate")
        url.appendPathExtension("php")
        
        var component = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let outputQuery = URLQueryItem(name: "output", value: "json")
        let stateSearchQuery = URLQueryItem(name: "state", value: state)
        component?.queryItems = [outputQuery, stateSearchQuery]
        
        guard let finalURL = component?.url else {completion([]); return}
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("There was an error fetching data! \(error.localizedDescription)")
                completion([]); return
            }
            
            guard let data = data else {completion([]); return}
            
            do {
                let topLevelJSON = try JSONDecoder().decode(TopLevelRepresentative.self, from: data)
                let representatives = topLevelJSON.results
                completion(representatives)
            } catch {
                print("there was an error decoding the representatives! \(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
    }
}

