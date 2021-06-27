//
//  UsersViewController.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 23.06.2021.
//

import UIKit

class UsersViewController: UIViewController {
    
    let usersView = UsersView()
    
    var usersTable : User = []
    
    let usersUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    let dataFetcher = DataFetcher()
    
    override func loadView() {
        super.loadView()
        self.view = usersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        usersView.navPanel.logoLabel.text = "Users"
        usersView.tblView.delegate = self
        usersView.tblView.dataSource = self
        usersView.tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        fetchDataUsing(url: usersUrl)
    }
    
    func fetchDataUsing(url: URL?) {
        guard let url = url else {return}
        DispatchQueue.global(qos: .background).async { [self] in
            let data = self.dataFetcher.getDataFrom(url: url)
            usersTable = self.dataFetcher.parseUser(json: data)
            DispatchQueue.main.async {
                usersView.tblView.reloadData()
            }
        }
    }
    
}


extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = usersView.tblView.dequeueReusableCell(withIdentifier: "cell")
        customCell?.accessoryType = .disclosureIndicator
        customCell?.textLabel?.text = "\(usersTable[indexPath.row].name)"
        return customCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let photosVC = PhotosViewController(uId: usersTable[indexPath.row].id)
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
}
