//
//  WeatherModel.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import Foundation

//   let weatherData = try? newJSONDecoder().decode(WeatherData.self, from: jsonData)

import Foundation

// MARK: - WeatherData
struct WeatherModel: Codable {
    let cod: Int?
    let message: String?
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let dailyWeathers: [DailyWeather]?

    enum CodingKeys: String, CodingKey {
        case  cod, message, lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case dailyWeathers = "daily"
    }
}

// MARK: - Daily
struct DailyWeather: Codable {
    let dt, sunrise, sunset, moonrise: Int?
    let moonset: Int?
    let moonPhase: Double?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Int?
    let dewPoint, windSpeed: Double?
    let windDeg: Int?
    let windGust: Double?
    let weather: [Weather]?
    let clouds, pop: Int?
    let uvi: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
