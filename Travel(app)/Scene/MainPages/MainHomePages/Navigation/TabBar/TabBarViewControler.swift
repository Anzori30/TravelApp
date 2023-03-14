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
    let isUserLogginedIn = UserDefaults.standard.bool(forKey: "isLogined")
  
    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
      
        start()
    }
   func start(){
        tabBarColor(tab: tabbar)
   }
    
    func logout(){
        print(isUserLogginedIn)
    do {
     try Auth.auth().signOut()
        guard isUserLogginedIn != true  else{
            let loginVC = UIStoryboard(name: "ViewController", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
            loginVC.navigationController?.isNavigationBarHidden = false
            navigationController!.setViewControllers([loginVC], animated: true)
            return
        }
        navigationController!.popViewController(animated: true)

        } catch let error as NSError {
           print("Error signing out: %@", error)
        }
        
    }
   
}

