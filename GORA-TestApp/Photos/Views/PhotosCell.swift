//
//  PhotosCell.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 26.06.2021.
//

import UIKit

final class PhotosCell: UITableViewCell {
    
    let containerView : UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.cornerRadius = 5
        cv.layer.borderWidth = 0.5
        cv.layer.borderColor = UIColor.systemGray5.cgColor
        cv.clipsToBounds = true
        return cv
    }()
    
    let imgView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray5
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var actIndView : UIActivityIndicatorView = {
        let actInd = UIActivityIndicatorView()
        actInd.translatesAutoresizingMaskIntoConstraints = false
        return actInd
    }()
    
    let descrLabel : CustomLabel = {
        let lbl = CustomLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: "Arial", size: 15)
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.containerView.addSubview(imgView)
        self.imgView.addSubview(actIndView)
        self.containerView.addSubview(descrLabel)
        self.contentView.addSubview(containerView)
        
        constrain()
        
    }
    
    fileprivate func constrain() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            //containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 350),
            
            imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            imgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            imgView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1),
            imgView.heightAnchor.constraint(greaterThanOrEqualTo: self.imgView.widthAnchor, multiplier: 1),
           
            actIndView.centerXAnchor.constraint(equalTo: self.imgView.centerXAnchor),
            actIndView.centerYAnchor.constraint(equalTo: self.imgView.centerYAnchor),
            actIndView.widthAnchor.constraint(equalToConstant: 60),
            actIndView.heightAnchor.constraint(equalToConstant: 60),

            descrLabel.topAnchor.constraint(equalTo: self.imgView.bottomAnchor, constant: 0),
            descrLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0),
            descrLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
            descrLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            descrLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
