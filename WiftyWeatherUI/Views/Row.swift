//
//  Row.swift
//  WiftyWeatherUI
//
//  Created by Seedy on 12/08/2024.
//

import SwiftUI

struct Row: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
    
}


#Preview {
    Row(logo: "thermometer", name: "Feels like", value: "8°")
}
