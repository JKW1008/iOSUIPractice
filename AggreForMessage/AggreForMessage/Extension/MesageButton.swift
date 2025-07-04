//
//  MesageButton.swift
//  AggreForMessage
//
//  Created by 정강우 on 6/29/25.
//

import UIKit

private struct TimerState {
    var timer: Timer?
    var remainingSeconds: Int
    var originalTitle: String
}

extension UIView {
    private struct AssociatedKeys {
        static var timerState = "timerState"
    }
    
    private var timerState: TimerState? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.timerState) as? TimerState
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.timerState, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func addMessageButton(title: String, topSpacingRatio: CGFloat = 0.05, textField: UITextField) -> UIButton {
        
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: self.bounds.width * 0.04, weight: .bold)
        button.backgroundColor = .systemBackground
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(UIAction { [weak self] _ in self?.messageButtonTapped(textField, button: button)}, for: .touchUpInside)
        
        self.addSubview(button)

        let topSpacing = self.bounds.height * topSpacingRatio
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: topSpacing),
            button.widthAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 1),
            button.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1)
        ])
        return button
    }
    
    @objc func messageButtonTapped(_ textField: UITextField, button: UIButton) {
        guard let text = textField.text else { return }
        
        let filteredText = text.filter { $0.isNumber }
        
        if filteredText.count == 11 {
            startVerifictionTimer(button: button)
        }
        
    }
    
    private func startVerifictionTimer(button: UIButton) {
        timerState?.timer?.invalidate()
        
        let originalTitle = timerState?.originalTitle ?? (button.title(for: .normal) ?? "인증문자 받기")
        
        timerState = TimerState(
            timer: nil,
            remainingSeconds: 300,
            originalTitle: originalTitle
        )
        
        button.isEnabled = true
        
        timerState?.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self, weak button] _ in guard let self = self, let button = button else { return }
            self.updateTimerDisplay(button: button)
        }
    }
    
    private func updateTimerDisplay(button: UIButton) {
        guard var state = timerState else { return }
        
        if state.remainingSeconds > 0 {
            let minutes = state.remainingSeconds / 60
            let seconds = state.remainingSeconds % 60
            let timeText = String(format: "%02분 %02d초", minutes, seconds)
            
            button.setTitle("인증문자 다시 받기 (\(timeText))", for: .normal)
            
            state.remainingSeconds -= 1
            timerState = state
        } else {
            state.timer?.invalidate()
            button.setTitle("인증문자 다시 받기", for: .normal)
            button.isEnabled = true
            
            timerState = nil
        }
    }
    
    func stopVerificationTimer(button: UIButton) {
        timerState?.timer?.invalidate()
        if let originalTitle = timerState?.originalTitle {
            button.setTitle(originalTitle, for: .normal)
        }
        button.isEnabled = true
        timerState = nil
    }
}
