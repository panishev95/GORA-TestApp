//
//  PhotosView.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 24.06.2021.
//

import UIKit

final class PhotosView: UIView {
    
    let navPanel : NavPanel = {
        let np = NavPanel()
        np.translatesAutoresizingMaskIntoConstraints = false
        np.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1.0)
        return np
    }()
    
    let tblView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        return tv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        self.addSubview(tblView)
        self.addSubview(navPanel)
        constrain()
    }
    
    fileprivate func constrain() {
        NSLayoutConstraint.activate([
            navPanel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -1),
            navPanel.topAnchor.constraint(equalTo: self.topAnchor, constant: -1),
            navPanel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 1),
            navPanel.heightAnchor.constraint(equalToConstant: 80),
            
            tblView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tblView.topAnchor.constraint(equalTo: self.navPanel.bottomAnchor, constant: 0),
            tblView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            tblView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
