//
//  NavPanel.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 23.06.2021.
//

import UIKit

class NavPanel : UIView {
    
    let logoLabel : UILabel = {
        let ll = UILabel()
        ll.textAlignment = .center
        ll.textColor = .black
        ll.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return ll
    }()
    
    let leadingNavBarButton : UIButton = {
        let bb = UIButton(type: .system)
        bb.tintColor = .systemBlue
        return bb
    }()
    
    convenience init() {
        self.init(frame: .zero)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.systemGray5.cgColor
        self.addSubview(logoLabel)
        self.addSubview(leadingNavBarButton)
        constrain()
    }
    
    fileprivate func constrain() {
        self.logoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.leadingNavBarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.logoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.logoLabel.widthAnchor.constraint(equalToConstant: 60),
            self.logoLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.leadingNavBarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            self.leadingNavBarButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.leadingNavBarButton.widthAnchor.constraint(equalToConstant: 60),
            self.leadingNavBarButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
}
