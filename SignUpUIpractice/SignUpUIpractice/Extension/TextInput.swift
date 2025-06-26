//
//  TextInput.swift
//  SignUpUIpractice
//
//  Created by 정강우 on 6/26/25.
//

import UIKit

extension UIView {
    func addTextField(placeholder: String, subtitleLabel: UILabel, topSpacingRatio: CGFloat = 0.03) -> UITextField {
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
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: topSpacing),
            textField.widthAnchor.constraint(equalToConstant: textFieldWidth),
            textField.heightAnchor.constraint(equalToConstant: textFieldHeight)
        ])
        
        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        
        return textField
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
