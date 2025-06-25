//
//  TextLabel.swift
//  CarrotMarketUI
//
//  Created by 정강우 on 6/25/25.
//

import UIKit

extension UILabel {
    func setText (_ text: String?) {
        if let text = text {
            self.text = text
        }
    }
}
