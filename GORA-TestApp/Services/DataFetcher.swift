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

    func parse(json: Data) -> User {
        let decoder = JSONDecoder()
        var parsedUser : User = []
        if let jsonUsers = try? decoder.decode(User.self, from: json) {
            parsedUser = jsonUsers
        }
        print(parsedUser.count)
        return parsedUser
    }
    
}


