//
//  WebKey.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import UIKit


class WebServices {
    
    #if DEBUGSTAGING || STAGING
        static let DomainName = "https://api.openweathermap.org/data/2.5/"
    #elseif DEBUGDEVELOPMENT || DEVELOPMENT
        static let DomainName = "https://api.openweathermap.org/data/2.5/"
    #else
        static let DomainName = "https://api.openweathermap.org/data/2.5/"
    #endif
    
    enum URLs: String {
        case onecall = "onecall?"
        
        var value: String {
            return WebServices.DomainName + self.rawValue
        }
    }
}

