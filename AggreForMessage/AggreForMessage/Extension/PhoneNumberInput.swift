//
//  PhoneNumberInput.swift
//  AggreForMessage
//
//  Created by 정강우 on 6/29/25.
//

import UIKit

import UIKit

extension UIView {
    func addTextField(placeholder: String, arrowImage: UIImageView?, messageButton: UIButton? , topSpacingRatio: CGFloat = 0.03) -> UITextField {
        let textField = UITextField()

        textField.placeholder = placeholder
        textField.keyboardType = .numberPad
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = UIColor.systemBackground
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.rightViewMode = .always
        
        addSubview(textField)
        
        let textFieldWidth = self.bounds.width * 0.9
        let textFieldHeight = self.bounds.height * 0.06
        let topSpacing = self.bounds.height * topSpacingRatio
        
        var topConstraint: NSLayoutConstraint
        
        if let image = arrowImage {
            topConstraint = textField.topAnchor.constraint(equalTo: image.bottomAnchor, constant: topSpacing)
        } else if let button = messageButton {
            topConstraint = textField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: topSpacing)
        } else {
            topConstraint = textField.topAnchor.constraint(equalTo: self.topAnchor, constant: topSpacing)
        }
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            topConstraint,
            textField.widthAnchor.constraint(equalToConstant: textFieldWidth),
            textField.heightAnchor.constraint(equalToConstant: textFieldHeight)
        ])
        
        textField.addTarget(self, action: #selector(textFileDidChange(_:)), for: .editingChanged)
        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        
        return textField
    }
    
    @objc func textFileDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        let filteredText = text.filter { $0.isNumber }
        
        if textField.placeholder == "인증번호 입력" {
            textField.text = String(filteredText.prefix(6))
        } else if textField.placeholder == "휴대폰 번호(-없이 숫자만 입력)" {
            textField.text = String(filteredText.prefix(11))
        }
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 1.3
            textField.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}

