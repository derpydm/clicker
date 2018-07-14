//
//  Struct.swift
//  Clicker
//
//  Created by Sean on 14/7/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import Foundation
class Result: Encodable, Decodable {
    
    var cps: Float
    var type: String
    var limit: Float
    
    init(cps: Float, type: String, limit: Float) {
        self.cps = cps
        self.type = type
        self.limit = limit
    }
    static func getArchiveURL() -> URL {
        let plistName = "results"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(results: [Result]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedResults = try? propertyListEncoder.encode(results)
        try? encodedResults?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Result]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedResultData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedResults = try? propertyListDecoder.decode(Array<Result>.self, from: retrievedResultData) else { return nil }
        return decodedResults
    }
}
