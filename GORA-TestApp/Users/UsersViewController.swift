//
//  UsersViewController.swift
//  GORA-TestApp
//
//  Created by Andrei Panishev on 23.06.2021.
//

import UIKit

class UsersViewController: UIViewController {
    
    let usersView = UsersView()
    
    var users = ["Gosha", "Petya", "Vasya"]
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
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
       
        if let url = url {
            getUsersListWith(url: url)
        }
    }
    
    func getUsersListWith(url: URL) {
        dataFetcher.getDataUsing(url: url)
    }

}


extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = usersView.tblView.dequeueReusableCell(withIdentifier: "cell")
        customCell?.accessoryType = .disclosureIndicator
        customCell?.textLabel?.text = "\(users[indexPath.row])"
        return customCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
}
