//
//  Quote.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/17/24.
//

import SwiftUI

struct Quotes: Codable {
    var quotesArray: [String]
}

@Observable class QuotesDataProvider {
    var quotes = Quotes(quotesArray: [])
    var status: Status = .initialized
       
    func loadData() async {
        status = .loading
        print("QuotesDataProvider: loading")

        guard
            let url = Bundle.main.url(forResource: "quotes", withExtension: "json"),
            let quotesData = try? Data(contentsOf: url),
            let quotesDecoded = try? JSONDecoder().decode(Quotes.self, from: quotesData)
        else {
            status = .error
            print("QuotesDataProvider: error")
            return
        }
        
        quotes = quotesDecoded
        
        status = .loadSuccess
        print("QuotesDataProvider: loadSuccess")
    }
    
    enum Status {
        case initialized
        case loading
        case loadSuccess
        case error
    }

}


