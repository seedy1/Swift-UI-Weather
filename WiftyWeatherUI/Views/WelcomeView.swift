//
//  WelcomeView.swift
//  WiftyWeatherUI
//
//  Created by Seedy on 12/08/2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("welcome traveler")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Please share your location")
                    .padding()
            }
            .padding()
            .multilineTextAlignment(.center)
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestionLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
