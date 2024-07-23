//
//  Quote.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/17/24.
//

import Foundation

struct Quotes: Codable {
    var quotesArray: [String]
}

class QuotesDataProvider: ObservableObject {
    @Published var quotes = Quotes(quotesArray: [])
    @Published var state: State = .initialized
    
    static let shared = QuotesDataProvider()
    
    init() {
        loadData()
    }
    
    func loadData() {
        state = .loading
        guard
            let url = Bundle.main.url(forResource: "quotes", withExtension: "json"),
            let quotesData = try? Data(contentsOf: url),
            let quotesDecoded = try? JSONDecoder().decode(Quotes.self, from: quotesData)
        else {
            state = .error
            return
        }
        
        quotes = quotesDecoded
        state = .loadSuccess
    }
    
    enum State {
        case initialized
        case loading
        case loadSuccess
        case error
    }
}


