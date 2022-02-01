//
//  WeatherViewModel.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import Foundation
import RealmSwift


class WeatherViewModel {
    
    var weatherModel: WeatherModel!
    var arrDailyWeather: List<DailyWeather>?
    
    private let realm = try! Realm()
    
    var timer = Timer()
    
    typealias dailyWeatherCallBack = (_ success: NetworkManager.statusCode, _ message: String) -> Void
    
    func getDailyWeatherAPI(response: @escaping dailyWeatherCallBack) {
        
        ///TODO: Added JSON in bundle to avoid API call while testing (As open API calls are limited 😋)
//        if let path = Bundle.main.path(forResource: "weather", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//
//                guard let weatherDataModel = try? JSONDecoder().decode(WeatherModel.self, from: data) else { return }
//                try self.realm.write {
//                    self.realm.add(weatherDataModel, update: .modified)
//                }
//
//                if let weatherDataModel = realm.objects(WeatherModel.self).first {
//                    self.weatherModel = weatherDataModel
//                    self.arrDailyWeather = self.weatherModel.dailyWeathers
//                }
//                response(NetworkManager.statusCode.success, "")
//                return
//              } catch let error {
//                  print(error.localizedDescription)
//              }
//        }

        var strURL = WebServices.URLs.onecall.value
        strURL += "&lat=25.2048"
        strURL += "&lon=55.2708"
        strURL += "&exclude=current,minutely,hourly,alerts"
        strURL += "&units=metric"
        strURL += "&appid=" + Constants.openWeatherMapAPIKey

        HPapiRequestWrapper.requestGETURL(strURL, dictHeader: nil, success: { [self] responceData in

            if let data = responceData {
                do {
                    guard let weatherDataModel = try? JSONDecoder().decode(WeatherModel.self, from: data) else {
                        return
                    }
                    try self.realm.write {
                        self.realm.add(weatherDataModel, update: .modified)
                    }
                    
                    if let weatherDataModel = realm.objects(WeatherModel.self).first {
                        self.weatherModel = weatherDataModel
                        self.arrDailyWeather = self.weatherModel.dailyWeathers
                    }
                    response(NetworkManager.statusCode.success, "")
                    return
                }
                catch let error {
                    response(NetworkManager.statusCode.fail, error.localizedDescription)
                    return
                }
            }
            else {
                response(NetworkManager.statusCode.fail, NetworkManager.somethingWentWrong)
            }
        }) { error in
            if let weatherDataModel = self.realm.objects(WeatherModel.self).first {
                self.weatherModel = weatherDataModel
                self.arrDailyWeather = self.weatherModel.dailyWeathers
                response(NetworkManager.statusCode.success, "")
            }
            else {
                response(NetworkManager.statusCode.fail, error.localizedDescription)
            }
        }
    }
    
    func getTempUnit() -> String {
        switch HPUserDefaults.shared.temperatureUnit {
        case TemperatureUnits.fahrenheit.rawValue:
            return StringBase.kFahrenheit
        default:
            return StringBase.kCelcius
        }
    }
    
    func getCalculatedTemperature(_ celsius: Double) -> String {
        switch HPUserDefaults.shared.temperatureUnit {
        case TemperatureUnits.fahrenheit.rawValue:
            return String(format: "%.2f", celsius.toFahrenheit())
        default:
            return String(format: "%.2f", celsius)
        }
    }
    
    
//    ///RealM Database
//    func write() {
////        let table = Furniture.create(withName: "table")
////        let chair = Furniture.create(withName: "chair")
////        let store = Store.create(withName: "Test Store", furniture: [table, chair])
//
//        // Write to Realm
//        print("Write to Realm")
//        try! realm.write {
////            realm.add(table)
////            realm.add(chair)
//            realm.add(store)
//        }
//    }
//
//    func read() {
//        // Read from Realm
//        print("Read from Realm")
//        let data = realm.objects(Store.self)
//        print(data)
//    }
//
//    func update() {
//        // Update data
//        if let table = realm.objects(Furniture.self).first {
//            try! realm.write {
//                table.name = "New Table Name"
//            }
//
//            print(realm.objects(Furniture.self).first ?? "")
//        }
//    }
//
//    func delete() {
//        // Delete data
//        print("Delete Data")
//        if let tableToDelete = realm.objects(Furniture.self).first {
//            try! realm.write {
//                realm.delete(tableToDelete)
//            }
//
//            print(realm.objects(Furniture.self).first ?? "")
//            print(realm.objects(Store.self).first ?? "")
//        }
//    }
}
