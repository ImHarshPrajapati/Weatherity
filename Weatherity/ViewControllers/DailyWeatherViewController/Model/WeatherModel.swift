//
//  WeatherModel.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import Foundation
import Realm
import RealmSwift

// MARK: - WeatherData
@objcMembers class WeatherModel: Object, Decodable {
    
    @objc dynamic var cod: Int = 0
    @objc dynamic var message: String = ""
    @objc dynamic var timezone: String = ""
    dynamic var dailyWeathers = List<DailyWeather>();

    enum CodingKeys: String, CodingKey {
        case cod, message
        case timezone
        case dailyWeathers = "daily"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        cod = (try? container.decode(Int.self, forKey: .cod)) ?? 0
        message = (try? container.decode(String.self, forKey: .message)) ?? ""
        timezone = (try? container.decode(String.self, forKey: .timezone)) ?? ""
        
        let dailyWeatherList = (try? container.decode([DailyWeather].self, forKey: .dailyWeathers)) ?? []
        dailyWeathers.append(objectsIn: dailyWeatherList)
        
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "timezone"
    }
    
    required init() {
        super.init()
    }
    
//    required init(value: Any, schema: RLMSchema) {
//        super.init(value: value, schema: schema)
//    }
//
//    required init(realm: RLMRealm, schema: RLMObjectSchema) {
//        super.init(realm: realm, schema: schema)
//    }
}

// MARK: - Daily
@objcMembers class DailyWeather: Object, Decodable {
    
    @objc dynamic var dt: Int = 0
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
    @objc dynamic var moonrise: Int = 0
    @objc dynamic var moonset: Int = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var windSpeed: Double = 0
    
    @objc dynamic var temp: Temp?
    dynamic var weather = List<Weather>();
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case temp
        case humidity
        case windSpeed = "wind_speed"
        case weather
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        dt = (try? container.decode(Int.self, forKey: .dt)) ?? 0
        sunrise = (try? container.decode(Int.self, forKey: .sunrise)) ?? 0
        sunset = (try? container.decode(Int.self, forKey: .sunset)) ?? 0
        moonrise = (try? container.decode(Int.self, forKey: .moonrise)) ?? 0
        moonset = (try? container.decode(Int.self, forKey: .moonset)) ?? 0
        humidity = (try? container.decode(Int.self, forKey: .humidity)) ?? 0
        windSpeed = (try? container.decode(Double.self, forKey: .windSpeed)) ?? 0
    
        temp = (try? container.decode(Temp.self, forKey: .temp)) ?? Temp()
        
        let weatherList = try container.decode([Weather].self, forKey: .weather)
        weather.append(objectsIn: weatherList)
        
        super.init()
    }
        
    required init() {
        super.init()
    }
}

// MARK: - Temp
@objcMembers class Temp: Object, Decodable {
    
    @objc dynamic var day: Double = 0
    @objc dynamic var night: Double = 0

    enum CodingKeys: String, CodingKey {
        case day, night
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        day = (try? container.decode(Double.self, forKey: .day)) ?? 0
        night = (try? container.decode(Double.self, forKey: .night)) ?? 0
        
        super.init()
    }
    
    required init() {
        super.init()
    }
}

// MARK: - Weather
@objcMembers class Weather: Object, Decodable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var main: String = ""
    @objc dynamic var weatherDescription: String = ""
    @objc dynamic var icon: String = ""

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = (try? container.decode(Int.self, forKey: .id)) ?? 0
        main = (try? container.decode(String.self, forKey: .main)) ?? ""
        weatherDescription = (try? container.decode(String.self, forKey: .weatherDescription)) ?? ""
        icon = (try? container.decode(String.self, forKey: .icon)) ?? ""
        
        super.init()
    }
        
    required init() {
        super.init()
    }
}
