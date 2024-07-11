//
//  ContentView.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    LogoImage(imageName: "Heart")
                    
                    Text("Inspire Love")
                        .font(.title2)
                }
                .frame(alignment: .topLeading)
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            print("share")
                        } label: {
                            Label("share", systemImage: "square.and.arrow.up")
                        }
                        
                        Button {
                            print("about us")
                        } label: {
                            Label("about us", systemImage: "info.circle")
                        }

                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LogoImage: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        
    }
}
