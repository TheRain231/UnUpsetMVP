//
//  ViewModel.swift
//  UnUpsetMVP
//
//  Created by Андрей Степанов on 07.11.2024.
//

import Foundation

@Observable
final class TimerViewModel {
    enum TimerState {
        case active
        case cancelled
    }


    // MARK: Private Properties
    private var timer = Timer()
    private var totalTimeForCurrentSelection: Int {
        (selectedMinutesAmount * 60) + selectedSecondsAmount
    }
    
    private var secondsToCompletion: Int = 300
    private(set) var minutesProgress: String = "5"
    private(set) var secondsProgress: String = "00"
    private(set) var secondsProgressFirst: String = "0"
    private(set) var secondsProgressSecond: String = "0"
        

    // MARK: Public Properties
    private(set) var selectedMinutesAmount: Int
    private(set) var selectedSecondsAmount: Int
    var state: TimerState = .cancelled {
        didSet {
            switch state {
            case .cancelled:
                timer.invalidate()
                secondsToCompletion = totalTimeForCurrentSelection
                
                minutesProgress = String(format: "%01i", secondsToCompletion / 60)
                secondsProgress = String(format: "%02i", max(secondsToCompletion % 60, 0))
                secondsProgressFirst = String(secondsProgress[secondsProgress.index(secondsProgress.startIndex, offsetBy: 0)])
                secondsProgressSecond = String(secondsProgress[secondsProgress.index(secondsProgress.startIndex, offsetBy: 1)])
                
                progress = 0.01
                
            case .active:
                startTimer()
                
                secondsToCompletion = totalTimeForCurrentSelection
                progress = 0.0001
            }
        }
    }
    
    init(){
        selectedMinutesAmount = 5
        selectedSecondsAmount = 0
        
        secondsToCompletion = totalTimeForCurrentSelection
        
        minutesProgress = String(format: "%01i", secondsToCompletion / 60)
        secondsProgress = String(format: "%02i", max(secondsToCompletion % 60, 0))
        
        secondsProgressFirst = String(secondsProgress[secondsProgress.index(secondsProgress.startIndex, offsetBy: 0)])
        secondsProgressSecond = String(secondsProgress[secondsProgress.index(secondsProgress.startIndex, offsetBy: 1)])
    }

    // Powers the ProgressView
    var progress: Float = 0.0001

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self else { return }

            self.secondsToCompletion -= 1
            self.progress = 1 - Float(self.secondsToCompletion) / Float(self.totalTimeForCurrentSelection)

            self.minutesProgress = String(format: "%01i", secondsToCompletion / 60)
            self.secondsProgress = String(format: "%02i", max(secondsToCompletion % 60, 0))
            
            secondsProgressFirst = String(secondsProgress[secondsProgress.index(secondsProgress.startIndex, offsetBy: 0)])
            secondsProgressSecond = String(secondsProgress[secondsProgress.index(secondsProgress.startIndex, offsetBy: 1)])
            
            if self.secondsToCompletion < 0 {
                self.state = .cancelled
            }
        })
    }
    
    func playButtonAction(){
        if state != .active{
            state = .active
        }
    }
    
    var isActive: Bool {
        state == .active
    }
}
