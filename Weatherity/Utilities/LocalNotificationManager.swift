//
//  LocalNotificationManager.swift
//  Weatherity
//
//  Created by Harsh on 30/01/2022.
//

import Foundation
import UserNotifications

struct NotificationIdentifier {
    static let weatherUpdate = "weather_update_local_notification"
}

class LocalNotificationManager {
    
    //    init() {
    
    //    }
    //
    
    
    func scheduleLocalNotification(_ title: String, subTitle: String, body: String) {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title =  title
        notificationContent.subtitle = subTitle
        notificationContent.body = body
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        let notificationRequest = UNNotificationRequest(identifier: NotificationIdentifier.weatherUpdate, content: notificationContent, trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
        }
    }
    
    func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
        
        UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
                    if let error = error {
                        print("Request Authorization Failed (\(error), \(error.localizedDescription))")
                    }
                    completionHandler(success)
                }
                break
            case .authorized:
                completionHandler(true)
                break
            case .denied:
                completionHandler(false)
                break
            default:
                break
            }
        }
    }
}
