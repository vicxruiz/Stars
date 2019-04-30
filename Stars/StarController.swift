//
//  StarController.swift
//  Stars
//
//  Created by Victor  on 4/30/19.
//  Copyright © 2019 com.Victor. All rights reserved.
//

import Foundation

class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    private(set) var stars: [Star] = []
    
    private var persistentURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documents.appendingPathComponent("stars.plist")
    }
    
    func addStar(named name: String, withDistance distance: Double) {
        //create a star
        //add a star to the list
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistentStore()
    }
    
    
    
    func saveToPersistentStore() {
        guard let url = persistentURL else {return}
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("error: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        //make sure file exists
        let fileManager = FileManager.default
        guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else {return}
        //load and decode
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("error: \(error)")
        }
    }
}
