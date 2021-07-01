//
//  PhotosViewController.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 24.06.2021.
//

import UIKit

class PhotosViewController: UIViewController {
    
    let photosView = PhotosView()
    
    var selectedUserAlbums : Albums = []
    
    var selectedUserPhotos : PhotosModel = []
    
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
        photosView.tblView.prefetchDataSource = self
        photosView.tblView.register(PhotosCell.self, forCellReuseIdentifier: "photoCell")
        
        loadData(using: albumsUrl, andPhotosWith: photosUrl)
    }
    
    func loadData(using albumsUrl: URL?, andPhotosWith photosUrl: URL?) {
        if let url = albumsUrl {
            DispatchQueue.global(qos: .background).async { [self] in
                let data = self.dataFetcher.getDataFrom(url: url)
                let albumsTable = self.dataFetcher.parseAlbums(json: data)
                for i in 0..<albumsTable.count {
                    if albumsTable[i].userID == selectedUserId {
                        selectedUserAlbums.append(albumsTable[i])
                    }
                }
            }
        }
        if let url = photosUrl {
            DispatchQueue.global(qos: .background).async { [self] in
                let data = self.dataFetcher.getDataFrom(url: url)
                let photosTable = self.dataFetcher.parsePhotos(json: data)
                for i in 0..<selectedUserAlbums.count {
                    for j in photosTable {
                        if selectedUserAlbums[i].id == j.albumID {
                            selectedUserPhotos.append(j)
                        }
                    }
                }
                DispatchQueue.global(qos: .background).async { [self] in
                    for k in 0..<selectedUserPhotos.count {
                        let dataToAdd = PhotosCellModel(image: UIImage(), description: selectedUserPhotos[k].title)
                        cellData.append(dataToAdd)
                    }
                    for k in 0..<3 {
                        setImageForCellData(using: k)
                    }
                    DispatchQueue.main.async {
                        photosView.tblView.reloadData()
                    }
                }
            }
        }
    }
    
    func getImageFor(index: Int, from userPhotos: PhotosModel) -> UIImage {
        var imageToReturn : UIImage = UIImage()
        if let photoURL = URL(string: "\(userPhotos[index].url)") {
            if let data = try? Data(contentsOf: photoURL ) {
                if let image = UIImage(data: data) {
                    imageToReturn = image
                }
            }
        }
        return imageToReturn
    }
    
    func setImageForCellData(using ind: Int) {
        DispatchQueue.global(qos: .background).async { [self] in
            cellData[ind].image = getImageFor(index: ind, from: selectedUserPhotos)
            DispatchQueue.main.async {
                photosView.tblView.reloadData()
            }
        }
        
    }
    
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
