//
//  ContentView.swift
//  WiftyWeatherUI
//
//  Created by Seedy on 08/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatheranager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
//                Text("lat \(location.latitude) long \(location.longitude)")
                if let weather = weather {
//                    Text("weather fetched")
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatheranager.getLocationWeather(lat: location.latitude, long: location.longitude)
                            }catch{
                                print("error getting weather")

                            }
                        }
                }
            }else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    WelcomeView().environmentObject(locationManager)

                }

            }
        }
        .padding()
        .background(Color(hue: 0.766, saturation: 0.883, brightness: 0.841))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
