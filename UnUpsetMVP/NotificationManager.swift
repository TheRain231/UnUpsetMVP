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
}
