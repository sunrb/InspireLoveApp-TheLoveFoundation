//
//  ContentView.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/11/24.
//

import SwiftUI

struct MainView: View {
    @Environment(QuotesDataProvider.self) var quotesDataProvider
    @State var currentQuote: String?
    
    var body: some View {
        NavigationStack {
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
            .onTapGesture {
                showNextQuote()
            }
            .onChange(of: quotesDataProvider.status) {
                switch quotesDataProvider.status {
                case .initialized, .loading, .error:
                    currentQuote = nil
                case .loadSuccess:
                    showNextQuote()
                }
            }
            .onAppear {
                switch quotesDataProvider.status {
                case .initialized, .loading, .error:
                    return
                case .loadSuccess:
                    showNextQuote()
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.white, for: .navigationBar)
        }

    }
    
    func showNextQuote() {
        currentQuote = quotesDataProvider.quotes.quotesArray.randomElement()
    }
    
    func getBackgroundImage() -> some View {
        Image("BackgroundHeart")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.bottom)
    }
    
    func getLoadingView() -> some View {
        Text("Still Loading...")
    }
    
    func getRetryView() -> some View {
        Button {
            print("retry pressed")
            loadData()
        } label: {
            Text("Press to Retry")
        }
    }
    
    func getLoadSuccessView() -> some View {
        Text("\(currentQuote ?? "Loading...")")
            .font(.title)
            .multilineTextAlignment(.center)
            .padding(10)
    }
    
    func loadData() {
        Task {
            await quotesDataProvider.loadData()
        }
    }
}

#Preview {
    MainView()
        .environment(QuotesDataProvider())
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
