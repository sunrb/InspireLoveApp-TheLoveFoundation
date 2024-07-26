//
//  InspireLoveAppApp.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/11/24.
//

import SwiftUI

@main
struct InspireLoveApp: App {
    @State var quotesDataProvider = QuotesDataProvider()
    
    init() {
        loadData()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(quotesDataProvider)
        }
    }
    
    func loadData() {
        Task {
            await quotesDataProvider.loadData()
        }
    }
}
