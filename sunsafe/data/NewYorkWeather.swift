//
//  NewYorkWeather.swift
//  sunsafe
//
//  Created by DPI Student 011 on 7/22/26.
//

import Foundation

struct NYDailyWeather: Identifiable {
    let id = UUID()
    let label: String
    let date: String
    let uvIndex: Double
    let condition: String
}

enum NewYorkWeather {
    static let lastWeek: [NYDailyWeather] = [
        NYDailyWeather(label: "Mon", date: "Jul 14", uvIndex: 7.2, condition: "Sunny"),
        NYDailyWeather(label: "Tue", date: "Jul 15", uvIndex: 8.4, condition: "Sunny"),
        NYDailyWeather(label: "Wed", date: "Jul 16", uvIndex: 5.1, condition: "Partly Cloudy"),
        NYDailyWeather(label: "Thu", date: "Jul 17", uvIndex: 3.6, condition: "Cloudy"),
        NYDailyWeather(label: "Fri", date: "Jul 18", uvIndex: 8.9, condition: "Sunny"),
        NYDailyWeather(label: "Sat", date: "Jul 19", uvIndex: 9.2, condition: "Sunny"),
        NYDailyWeather(label: "Sun", date: "Jul 20", uvIndex: 6.5, condition: "Partly Cloudy")

]
}
