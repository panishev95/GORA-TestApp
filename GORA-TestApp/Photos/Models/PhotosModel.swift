//
//  PhotosModel.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 27.06.2021.
//

import Foundation

struct PhotosModelElement: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias PhotosModel = [PhotosModelElement]
