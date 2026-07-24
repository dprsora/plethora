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
        ChiDailyWeather(label: "sun", date: "jul 26", uvIndex: 9, condition: "partly cloudy"),
        ChiDailyWeather(label: "mon", date: "jul 27", uvIndex: 9, condition: "sunny"),
        ChiDailyWeather(label: "tues", date: "jul 28", uvIndex: 8, condition: "partly cloudy"),
        ChiDailyWeather(label: "wed", date: "jul 29", uvIndex: 9, condition: "sunny"),
        ChiDailyWeather(label: "thurs", date: "jul 30", uvIndex: 9, condition: "sunny"),
        ChiDailyWeather(label: "fri", date: "jul 31", uvIndex: 4, condition: "rainy"),
        ChiDailyWeather(label: "sat", date: "aug 1", uvIndex: 3, condition: "rainy")

]
}
