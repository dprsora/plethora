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
        NYDailyWeather(label: "sun", date: "jul 26", uvIndex: 6, condition: "partly cloudy"),
        NYDailyWeather(label: "mon", date: "jul 27", uvIndex: 9, condition: "sunny"),
        NYDailyWeather(label: "tues", date: "jul 28", uvIndex: 9, condition: "sunny"),
        NYDailyWeather(label: "wed", date: "jul 29", uvIndex: 9, condition: "sunny"),
        NYDailyWeather(label: "thurs", date: "jul 30", uvIndex: 8, condition: "partly cloudy"),
        NYDailyWeather(label: "fri", date: "jul 31", uvIndex: 9, condition: "sunny"),
        NYDailyWeather(label: "sat", date: "aug 1", uvIndex: 7, condition: "partly cloudy")

]
}
