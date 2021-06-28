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
        print(index)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotosCell
       
        cell.actIndView.startAnimating()
        cell.descrLabel.text = cellData[indexPath.row].description
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            cell.imgView.image = self.getImagesWith(indexPath: indexPath)
            cell.actIndView.stopAnimating()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let autoHeight = UITableView.automaticDimension
        return max(autoHeight, 415)
    }
    
    func getImagesWith(indexPath: IndexPath) -> UIImage {
        DispatchQueue.global(qos: .background).sync {
            let image = getImageFor(index: indexPath.row, from: selectedUserPhotos)
            return image
        }
    }
    
}
