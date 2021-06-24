//
//  UsersModel.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 24.06.2021.
//

import Foundation

struct WelcomeElement: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias Welcome = [WelcomeElement]
