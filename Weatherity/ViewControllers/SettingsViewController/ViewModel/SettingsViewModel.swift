//
//  SettingsViewModel.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import Foundation



class SettingsViewModel {

    func getSelectedTempUnit() -> Int {
        switch HPUserDefaults.shared.temperatureUnit {
        case TemperatureUnits.fahrenheit.rawValue:
            return 1
        default:
            return 0
        }
    }
    
    func changeTemperatureUnit(_ index: Int) {
        switch index {
        case 0:
            HPUserDefaults.shared.temperatureUnit = TemperatureUnits.celsius.rawValue
        case 1:
            HPUserDefaults.shared.temperatureUnit = TemperatureUnits.fahrenheit.rawValue
        default:
            HPUserDefaults.shared.temperatureUnit = TemperatureUnits.celsius.rawValue
        }
    }
}
