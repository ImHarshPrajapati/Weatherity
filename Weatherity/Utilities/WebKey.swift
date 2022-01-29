//
//  WebKey.swift
//  
//
//  Created by Harshad Pipaliya on 28/12/19.
//  Copyright © 2019 Mobio Solutions. All rights reserved.
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

