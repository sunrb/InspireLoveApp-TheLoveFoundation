//
//  ContentView.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/11/24.
//

import SwiftUI

struct MainView: View {
    @Environment(QuotesDataProvider.self) var quotesDataProvider
    
    var body: some View {
        NavigationView {
            ZStack {
                getBackgroundImage()
                
                switch quotesDataProvider.status {
                case .initialized:
                    getRetryView()
                case .loading:
                    getLoadingView()
                case .loadSuccess:
                    getLoadSuccessView()
                case .error:
                    getRetryView()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    LogoImage(imageName: "Heart")
                    Text("Inspire Love")
                        .font(.title2)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    ShareLink(item: URL(string: "https://www.thelovefoundation.com/index.html")!) {
                        Label("share", systemImage: "square.and.arrow.up")
                    }
                    
                    NavigationLink(destination: AboutUs()) {
                        Label("about us", systemImage: "info.circle")
                    }
                }
            }
        }

    }
    
    func getBackgroundImage() -> some View {
        Image("BackgroundHeart")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.bottom)
    }
    
    func getLoadingView() -> some View {
        Text("Loading...")
    }
    
    func getRetryView() -> some View {
        Button {
            print("retry pressed")
        } label: {
            Text("Press to retry")
        }
    }
    
    func getLoadSuccessView() -> some View {
        Text("Load success")
    }
}

#Preview {
    MainView()
}

struct LogoImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
    }
}











