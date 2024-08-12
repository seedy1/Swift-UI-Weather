//
//  WeatherView.swift
//  WiftyWeatherUI
//
//  Created by Seedy on 12/08/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack(alignment: .leading) {
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(weather.name)
                                .bold()
                                .font(.title)
                            
                            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                .fontWeight(.light)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                VStack(spacing: 20) {
                                    Image(systemName: "cloud")
                                        .font(.system(size: 40))
                                    
                                    Text("\(weather.weather[0].main)")
                                }
                                .frame(width: 150, alignment: .leading)
                                
                                Spacer()
                                
                                Text(weather.main.feelsLike.roundDouble() + "°")
                                    .font(.system(size: 100))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            
                            Spacer()
                                .frame(height:  80)
                            
                            AsyncImage(url: URL(string: "https://www.newyorkwelcome.net/kimg/1200/central-park-autunno.jpg")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350)
                                    .cornerRadius(40)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Weather now")
                                .bold()
                                .padding(.bottom)
                            
                            HStack {
                                Row(logo: "thermometer",
                                    name: "Min temp",
                                    value: (weather.main.tempMin.roundDouble() + ("°")))
                                Spacer()
                                Row(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                            }
                            
                            HStack {
                                Row(logo: "wind",
                                    name: "Wind speed",
                                    value: (weather.wind.speed.roundDouble() + " m/s"))
                                Spacer()
                                Row(logo: "humidity",
                                    name: "Humidity",
                                    value: "\(weather.main.humidity.roundDouble())%")
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.bottom, 20)
                        .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                        .background(.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeatherData)
}
