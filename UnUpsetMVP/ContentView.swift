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
                    .frame(height: 1)
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    ContentView()
}
