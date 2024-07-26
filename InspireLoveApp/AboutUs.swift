//
//  AboutUs.swift
//  InspireLoveApp
//
//  Created by Rubing on 7/12/24.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
        NavigationStack {
            ZStack {
                getBackground()
                ScrollView {
                    getBody()
                }
            }
        }
    }
    
    func getBody() -> some View {
        VStack {
            Image("Earth")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Text("The Love Foundation Inc. is a nonprofit organization with the mission of inspiring people to love unconditionally. Our vision is to assist people by building a practical foundation and understanding of unconditional love within Stindividuals and society as a whole. \n\nOur programs further the awareness and application of unconditional love through education, research, and charity. Our intention is to explore a variety of creative activities and presentations that enhance unity and self-conscious expression while promoting love and respect to all aspects of life.\n\nQuotes provided by: Harold W. Becker.")
                .font(.callout)
                .multilineTextAlignment(.leading)
                .padding(10)
            
            Link(destination: URL(string: "https://www.thelovefoundation.com/index.html")!) {
                Text("TheLoveFoundation.com")
                    .multilineTextAlignment(.leading)
            }

            
            Spacer()
        }
        .offset(y: 50)
    }
    
    func getBackground() -> some View {
        Color.background
            .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    AboutUs()
}
