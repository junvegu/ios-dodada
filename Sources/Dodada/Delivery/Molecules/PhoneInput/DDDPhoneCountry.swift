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
    public let formatPattern: String
    public let limit: Int
    public let regex: String
    public let formatExample: String
    
    
    public init(
        id: String,
        name: String,
        flag: String,
        code: String,
        dial_code: String,
        formatPattern: String,
        limit: Int,
        formatExample: String,
        regex: String
    ) {
        self.id = id
        self.name = name
        self.flag = flag
        self.code = code
        self.regex = regex
        self.dial_code = dial_code
        self.formatPattern = formatPattern
        self.formatExample = formatExample
        self.limit = limit
    }

    static let allCountry: [DDDCountryData] = Bundle.module.decode("Countries.json")
    static let example = allCountry[0]
}
