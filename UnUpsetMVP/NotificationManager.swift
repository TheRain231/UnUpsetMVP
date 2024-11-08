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
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
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
        content.badge = .init()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
