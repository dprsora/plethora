//
//  ChicagoWeather.swift
//  sunsafe
//
//  Created by DPI Student 011 on 7/21/26.
//

import Foundation

struct ChiDailyWeather: Identifiable {
    let id = UUID()
    let label: String
    let date: String
    let uvIndex: Double
    let condition: String
}

enum ChicagoWeather {
    static let lastWeek: [ChiDailyWeather] = [
        ChiDailyWeather(label: "Mon", date: "Jul 14", uvIndex: 7.2, condition: "Sunny"),
        ChiDailyWeather(label: "Tue", date: "Jul 15", uvIndex: 8.4, condition: "Sunny"),
        ChiDailyWeather(label: "Wed", date: "Jul 16", uvIndex: 5.1, condition: "Partly Cloudy"),
        ChiDailyWeather(label: "Thu", date: "Jul 17", uvIndex: 3.6, condition: "Cloudy"),
        ChiDailyWeather(label: "Fri", date: "Jul 18", uvIndex: 8.9, condition: "Sunny"),
        ChiDailyWeather(label: "Sat", date: "Jul 19", uvIndex: 9.2, condition: "Sunny"),
        ChiDailyWeather(label: "Sun", date: "Jul 20", uvIndex: 6.5, condition: "Partly Cloudy")

]
}
