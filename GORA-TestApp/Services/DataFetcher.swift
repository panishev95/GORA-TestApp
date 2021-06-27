//
//  DataFetcher.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 24.06.2021.
//

import UIKit

class DataFetcher {
    
    func getDataFrom(url: URL?) -> Data {
        var dataToReturn = Data()
        if let url = url {
            if let data = try? Data(contentsOf: url) {
               dataToReturn = data
            }
        }
        return dataToReturn
    }

    func parseUser(json: Data) -> User {
        let decoder = JSONDecoder()
        var parsedUser : User = []
        if let jsonUsers = try? decoder.decode(User.self, from: json) {
            parsedUser = jsonUsers
        }
        return parsedUser
    }
    
    func parseAlbums(json: Data) -> Albums {
        let decoder = JSONDecoder()
        var parsedAlbums : Albums = []
        if let jsonAlbums = try? decoder.decode(Albums.self, from: json) {
            parsedAlbums = jsonAlbums
        }
        return parsedAlbums
    }
    
    func parsePhotos(json: Data) -> PhotosModel {
        let decoder = JSONDecoder()
        var parsedPhotos : PhotosModel = []
        if let jsonPhotos = try? decoder.decode(PhotosModel.self, from: json) {
            parsedPhotos = jsonPhotos
        }
        return parsedPhotos
    }
    
    
}


