//
//  WebKey.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import UIKit


class WebServices {
    
    static let DomainName = "https://api.openweathermap.org/data/2.5/"
    
    enum URLs: String {
        case onecall = "onecall?"
        
        var value: String {
            return WebServices.DomainName + self.rawValue
        }
    }
}

