//
//  File.swift
//  
//
//  Created by Junior Quevedo Gutiérrez  on 14/10/24.
//

import Foundation

public struct DDDCountryData: Codable, Identifiable {
    public let id: String
    public let name: String
    public let flag: String
    public let code: String
    public let dial_code: String
    public let pattern: String
    public let limit: Int
    
    public init(id: String, name: String, flag: String, code: String, dial_code: String, pattern: String, limit: Int) {
        self.id = id
        self.name = name
        self.flag = flag
        self.code = code
        self.dial_code = dial_code
        self.pattern = pattern
        self.limit = limit
    }

    static let allCountry: [DDDCountryData] = Bundle.module.decode("Countries.json")
    static let example = allCountry[0]
}
