//
//  WeatherManager.swift
//  WiftyWeatherUI
//
//  Created by Seedy on 12/08/2024.
//

import Foundation
import CoreLocation

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

class WeatherManager{
    func getLocationWeather(lat: CLLocationDegrees, long: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=432c9485fb7da1da3e92c8150cee05eb&units=metric")
        else{
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, resp) = try await URLSession.shared.data(for: urlRequest)
        
        guard (resp as? HTTPURLResponse)?.statusCode == 200 
        else{
            fatalError("Error while fetching data")
        }

        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData

    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
