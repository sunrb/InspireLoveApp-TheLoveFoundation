//
//  Quote.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/17/24.
//

import Foundation

struct ReadJsonData: Codable {
    let quote: String
    
    func readQuoteFromBundle() -> ReadJsonData? {
        guard let url = Bundle,main.url(forResource: "quotes", withExtension: "json") else {
            return nil
        }
        return try? readJSONFile(with: url)
    }
    
    
}


extension
