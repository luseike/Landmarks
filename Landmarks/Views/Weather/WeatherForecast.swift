//
//  WeatherForecast.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/17.
//

import SwiftUI

struct WeatherForecast: View {
    var body: some View {
        HStack {
//            VStack {
//                Text("Mon")
//                Image(systemName: "sun.max.fill")
//                    .foregroundColor(.orange)
//                Text("High: 70")
//                Text("Low: 50")
//            }
//            .padding(.all)
            
            DayForecast(day: "Mon", isRain: false, high: 70, low: 50)
            
            DayForecast(day: "Tue", isRain: true, high: 60, low: 40)
        }
    }
}

#Preview {
    WeatherForecast()
}

struct DayForecast: View {
    let day: String
    let isRain: Bool
    let high: Int
    let low: Int
    
    // computed property need return a value
    // Swift encourages programmers to remove the return keyword if the code is simle enough
    var iconInfo: (name: String, color: Color) {
        isRain ? ("cloud.rain.fill", .orange) : ("sun.max.fill", .blue)
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconInfo.name)
                .foregroundColor(iconInfo.color)
                .font(.largeTitle)
                .padding(5)
            Text("\(high)")
                .fontWeight(.semibold)
            Text("\(low)")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding(.all)
    }
}
