//
//  PhotosDelegate+DataSource.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 27.06.2021.
//

import UIKit

extension PhotosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotosCell
        cell.actIndView.startAnimating()
        cell.descrLabel.text = "\(cellData[indexPath.row].description)"
//        cell.descrLabel.text = "\(selectedPhotos[indexPath.row].title)"
//        cell.imgView.image = photosArray[indexPath.row]
        cell.imgView.image = cellData[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let autoHeight = UITableView.automaticDimension
        if autoHeight > 415 {
            return autoHeight
        } else {
            return 415
        }
    }
    
}
