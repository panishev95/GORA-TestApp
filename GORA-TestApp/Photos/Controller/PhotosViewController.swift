//
//  PhotosViewController.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 24.06.2021.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photosView = PhotosView()
    
    var albumsTable : Albums = []
    
    var selectedAlbums : Albums = []
    
    var photosTable : PhotosModel = []
    
    var selectedPhotos : PhotosModel = []
    
    var cellData : [PhotosCellModel] = []
    
    let albumsUrl = URL(string: "https://jsonplaceholder.typicode.com/albums")
    
    let photosUrl = URL(string: "https://jsonplaceholder.typicode.com/photos")
    
    let dataFetcher = DataFetcher()
    
    var selectedUserId = 0
    
    convenience init(uId: Int) {
        self.init()
        self.selectedUserId = uId
    }
    
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
        
        photosView.tblView.delegate = self
        photosView.tblView.dataSource = self
        photosView.tblView.register(PhotosCell.self, forCellReuseIdentifier: "photoCell")
       
        fetchDataUsing(url: albumsUrl)
        
    }
    
    fileprivate func fetchDataUsing(url: URL?) {
        guard let url = url else {return}
        DispatchQueue.global(qos: .background).async { [self] in
            let data = self.dataFetcher.getDataFrom(url: url)
            albumsTable = self.dataFetcher.parseAlbums(json: data)
            for i in 0..<albumsTable.count {
                if albumsTable[i].userID == selectedUserId {
                    selectedAlbums.append(albumsTable[i])
                }
            }
            fetchPhotosUsing(url: photosUrl)
            DispatchQueue.main.async {
                photosView.tblView.reloadData()
            }
        }
    }
    
    fileprivate func fetchPhotosUsing(url: URL?) {
        guard let url = url else {return}
        DispatchQueue.global(qos: .background).async { [self] in
            let data = self.dataFetcher.getDataFrom(url: url)
            photosTable = self.dataFetcher.parsePhotos(json: data)
            for i in 0..<photosTable.count {
                for j in 0..<selectedAlbums.count {
                    if photosTable[i].albumID == selectedAlbums[j].id {
                        selectedPhotos.append(photosTable[i])
                    }
                }
            }
            cellData = getImages()
            print(cellData.count)
            DispatchQueue.main.async {
                photosView.tblView.reloadData()
            }
        }
    }
    
    fileprivate func getImages() -> [PhotosCellModel] {
        var arrayOfImages : [PhotosCellModel] = []
        for photo in selectedPhotos {
            if let photoURL = URL(string: "\(photo.url)") {
                if let data = try? Data(contentsOf: photoURL ) {
                    if let image = UIImage(data: data) {
                        let dataToAdd = PhotosCellModel(image: image, description: photo.title)
                        arrayOfImages.append(dataToAdd)
                    }
                }
            }
        }
        return arrayOfImages
    }
    
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
