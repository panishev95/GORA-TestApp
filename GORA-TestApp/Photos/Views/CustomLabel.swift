//
//  CustomLabel.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 27.06.2021.
//

import UIKit

class CustomLabel: UILabel {
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20)))
    }
}
