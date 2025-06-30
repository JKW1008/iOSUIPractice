//
//  AgreeButton.swift
//  AggreForMessage
//
//  Created by 정강우 on 6/29/25.
//

import UIKit

extension UIView {
    func addAgreeButton(title: String, warningMessage: UILabel, numberInput: UITextField, topSpacingRatio: CGFloat = 0.02) -> UIButton {
        let agreeButton = UIButton(type: .system)
        agreeButton.setTitle(title, for: .normal)
        agreeButton.titleLabel?.font = .systemFont(ofSize: self.bounds.width * 0.05, weight: .bold)
        agreeButton.translatesAutoresizingMaskIntoConstraints = false
        agreeButton.layer.cornerRadius = 8.0
        
        // 초기 버튼 상태 설정
        updateButtonState(button: agreeButton, textField: numberInput)
        
        // 뷰에 추가
        addSubview(agreeButton)
        
        // Auto Layout 설정
        let topSpacing = self.bounds.height * topSpacingRatio
        NSLayoutConstraint.activate([
            agreeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            agreeButton.topAnchor.constraint(equalTo: warningMessage.bottomAnchor, constant: topSpacing),
            agreeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            agreeButton.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.06)
        ])
        
        // 텍스트필드 변경 시 버튼 상태 업데이트
        numberInput.addTarget(self, action: #selector(textFieldChangedForButton(_:)), for: .editingChanged)
        
        // 버튼 참조를 위해 tag 설정 (간단한 방법)
        agreeButton.tag = 1000
        
        return agreeButton
    }
    
    @objc private func textFieldChangedForButton(_ textField: UITextField) {
        // tag로 버튼 찾기
        if let button = self.viewWithTag(1000) as? UIButton {
            updateButtonState(button: button, textField: textField)
        }
    }
    
    private func updateButtonState(button: UIButton, textField: UITextField) {
        if let text = textField.text, text.filter(\.isNumber).count == 6 {
            // 6자리 숫자가 입력된 경우 - 활성화
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemOrange // carrotOrange 대신 시스템 색상 사용
            button.isEnabled = true
        } else {
            // 6자리가 아닌 경우 - 비활성화
            button.setTitleColor(.systemGray2, for: .normal)
            button.backgroundColor = .systemGray4
            button.isEnabled = false
        }
    }
}
