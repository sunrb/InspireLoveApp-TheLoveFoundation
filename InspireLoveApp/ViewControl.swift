//
//  ContentView.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/11/24.
//

import SwiftUI

struct ViewControl: View {
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                HStack {
                    LogoImage(imageName: "Heart")
                    
                    Text("Inspire Love")
                        .font(.title2)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    
                    LogoImage(imageName: "Heart")
                    
                    Text("Inspire Love")
                        .font(.title2)
                }
                
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

#Preview {
    ViewControl()
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
