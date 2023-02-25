//
//  TabBarViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class TabBarViewControler: UITabBarController{
    
    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
   func start(){
            tabBarColor(tab: tabbar)
    }
   
}

