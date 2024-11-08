//
//  TimerView.swift
//  UnUpsetMVP
//
//  Created by Андрей Степанов on 07.11.2024.
//

import SwiftUI

struct TimerView: View {
    @State var vm: TimerViewModel
    private let lineWidth: CGFloat = 24.0
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            
            VStack{
                ZStack{
                    ProgressView(progress: vm.progress)
                        .frame(width: size.width * 0.7, height: size.width * 0.7)
                    HStack(alignment: .center, spacing: 0) {
                        Group{
                            Text(vm.minutesProgress)
                                .frame(width: 60, alignment: .trailing)
                            Text(":")
                                .offset(y: -10)
                            Text("\(vm.secondsProgressFirst)")
                                .frame(width: 60, alignment: .leading)
                            Text("\(vm.secondsProgressSecond)")
                                .frame(width: 60, alignment: .leading)
                        }
                        .font(.system(size: 100))
                    }
                }
                
                Button {
                    vm.playButtonAction()
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 70))
                        .padding()
                }
                .buttonStyle(PlayButtonStyle(isActive: vm.isActive))
                .animation(.smooth, value: vm.state)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func ProgressView(progress: Float) -> some View {
        ZStack {
            // Secondary circle
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(Color("SecondColor"))
            
            // Main circle
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth,
                                           lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("FirstColor"))
                .rotationEffect(Angle(degrees: 270))
        }
        .animation(.snappy(duration: 1.0), value: progress)
    }
}

struct PlayButtonStyle: ButtonStyle {
    var isActive: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color(isActive ? "ButtonActive" : "ButtonInactive"))
    }
}

#Preview {
    ContentView()
}
