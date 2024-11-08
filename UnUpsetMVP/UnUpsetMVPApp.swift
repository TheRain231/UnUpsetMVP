//
//  UnUpsetMVPApp.swift
//  UnUpsetMVP
//
//  Created by Андрей Степанов on 07.11.2024.
//

import SwiftUI

@main
struct UnUpsetMVPApp: App {
    
    init(){
        NotificationManager.shared.requestAuthorization()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
