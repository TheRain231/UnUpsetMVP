//
//  NotificationManager.swift
//  UnUpsetMVP
//
//  Created by Андрей Степанов on 08.11.2024.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if let error = error {
                print("error: \(error)")
            }  else {
                print("success: \(success)")
            }
        }
    }
    
    func scheduleNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "Пример!"
        content.body = "Лучше бы тебе запустить этот таймер"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10800, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
