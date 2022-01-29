//
//  UserDefaults.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import Foundation

class HPUserDefaults: NSObject {
    
    static let shared = HPUserDefaults()
    var temperatureUnit: String {
       get {
           return UserDefaults.standard.string(forKey: "temperatureUnit") ?? TemperatureUnits.celsius.rawValue
       }
       set {
           UserDefaults.standard.set(newValue, forKey: "temperatureUnit")
       }
    }
}
