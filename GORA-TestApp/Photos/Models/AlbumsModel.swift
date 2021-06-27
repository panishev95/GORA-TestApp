//
//  AlbumsModel.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 26.06.2021.
//

import Foundation

struct AlbumsModel: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [AlbumsModel]
