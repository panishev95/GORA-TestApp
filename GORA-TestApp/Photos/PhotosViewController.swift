//
//  PhotosViewController.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 24.06.2021.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photosView = PhotosView()
    
    override func loadView() {
        super.loadView()
        self.view = photosView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        photosView.navPanel.logoLabel.text = "Photos"
        photosView.navPanel.leadingNavBarButton.setTitle("Users", for: .normal)
        photosView.navPanel.leadingNavBarButton.setImage(UIImage(systemName: "chevron.backward", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        photosView.navPanel.leadingNavBarButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
    }
    
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }

}
