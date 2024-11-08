//
//  ContentView.swift
//  UnUpsetMVP
//
//  Created by Андрей Степанов on 07.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State var vm: TimerViewModel = TimerViewModel()
    
    var body: some View {
        TabView {
            Tab("Timer", systemImage: "timer") {
                ZStack {
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    TimerView(vm: self.vm)
                }
            }
            
            Tab("Profile", systemImage: "person") {
                Text("Profile")
            }
            
        }
        .overlay(alignment: .bottom) {
            ZStack{
                Rectangle()
                    .frame(height: 3)
            }
            .offset(y: -50)
        }
        .onAppear {
            setupTabBarAppearance()
        }
        
    }
    
    func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // Sets an opaque background color
        appearance.backgroundColor = UIColor(named: "BackgroundColor") // Sets the background color
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "ButtonActive") // Color for unselected tab icons
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "ButtonActive") ?? UIColor.gray] // Color for unselected tab text
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
}

#Preview {
    ContentView()
}
