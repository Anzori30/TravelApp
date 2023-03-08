//
//  UserViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class UserViewControler: UIViewController {
    @IBOutlet weak var loaderSpiner: UIActivityIndicatorView!
    let listName = [
    Setting(listName: "Your Profile"),
     Setting(listName: "Booking List"),
     Setting(listName: "Promotion"),
     Setting(listName: "payment"),
     Setting(listName: "Setting"),
     Setting(listName: "Logout"),
    ]
  
    @IBOutlet private weak var userImage: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
       
    }
    override func viewDidAppear(_ animated: Bool) {
        bacgroundColor(view: view)
    }
  
}


extension UserViewControler: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configure(with: listName[indexPath.row])
        return cell
    }
}


extension UserViewControler: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let value = listName[indexPath.row]
        if value.listName == "Setting"{
        let vc = UIStoryboard(name: "SettingPage", bundle: nil).instantiateViewController(identifier: "SettingPage") as! SettingPage
            navigationController?.pushViewController(vc, animated: true)
        }
        if value.listName == "Logout"{
            
            UserDefaults.standard.set(false, forKey: "isLogined")
            loaderSpiner.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.loaderSpiner.stopAnimating()
                (self.tabBarController as? TabBarViewControler)?.logout()
                }
            
        }
    }
}
