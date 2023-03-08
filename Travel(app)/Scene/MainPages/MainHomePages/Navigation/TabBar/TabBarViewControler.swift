//
//  TabBarViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit
import Firebase
class TabBarViewControler: UITabBarController{
    
    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        start()
    }
   func start(){
        tabBarColor(tab: tabbar)
    }
    func logout(){
       
        do {
          try Auth.auth().signOut()
            if let navigationController = navigationController {
                navigationController.popViewController(animated: true)
                navigationController.isNavigationBarHidden = false
            }
        } catch let error as NSError {
          print("Error signing out: %@", error)
        }
    }
   
}

