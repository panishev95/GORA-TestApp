//
//  PhotosDelegate+DataSource.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 27.06.2021.
//

import UIKit

extension PhotosViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let index = indexPaths[0].row
        setImageForCellData(using: index)
        print(index)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotosCell
       
        cell.descrLabel.text = cellData[indexPath.row].description
        
        let img = cellData[indexPath.row].image
        if let image = img {
            cell.imgView.image = image
        }
        
        if cell.imgView.image == UIImage() {
            cell.actIndView.startAnimating()
        } else {
            cell.actIndView.stopAnimating()
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let autoHeight = UITableView.automaticDimension
        return max(autoHeight, 415)
    }
    
}
