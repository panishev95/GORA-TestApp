//
//  Extensions.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 27.06.2021.
//

import UIKit

extension UITextView {
    func textAlign(){
        self.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 2)
    }
}

extension UILabel {
    func setMargins(margin: CGFloat = 10) {
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
