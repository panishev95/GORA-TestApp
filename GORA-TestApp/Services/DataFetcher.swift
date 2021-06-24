//
//  DataFetcher.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 24.06.2021.
//

import UIKit

class DataFetcher {
    
    func getDataUsing(url: URL?) {
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
            }
            task.resume()
        }
    }
    
    
}


