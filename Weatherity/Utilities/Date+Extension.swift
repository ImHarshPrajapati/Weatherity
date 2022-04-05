//
//  Date+Extension.swift
//  Weatherity
//
//  Created by Harsh on 29/01/2022.
//

import Foundation
import UIKit

extension Date {
    static var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    }
    static var afterTwoDay: Date {
        return Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date()
    }
    static var afterThreeDay: Date {
        return Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date()
    }
}

extension Date {

    func offsetFrom(_ date: Date) -> String {

        let dayHourMinuteSecond: Set<Calendar.Component> = [.year, .month, .day]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self);

        let days = "\(difference.day ?? 0) Day(s)"
        let months = "\(difference.month ?? 0) Month(s)" + " " + days
        let years = "\(difference.year ?? 0) Year(s)" + " " + months
        
        if let year = difference.year, year    > 0 { return years }
        if let month = difference.month, month    > 0 { return months }
        if let day = difference.day, day          > 0 { return days }
        return "N/A"
    }

}

//date to string conversaion
extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

