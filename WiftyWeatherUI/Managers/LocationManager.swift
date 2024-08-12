//
//  LocationManager.swift
//  WiftyWeatherUI
//
//  Created by Seedy on 10/08/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestionLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let ll = locations.first?.coordinate{
//            location = ll
//            isLoading = false
//
//        }
        location = locations.first?.coordinate //?? CLLocationCoordinate2D(latitude: 2, longitude: -66)
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Erro getting locations", error)
        isLoading = false
    }
}
