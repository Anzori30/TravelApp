//
//  ViewController.swift
//  Travel(app)
//
//  Created by anzori  on 2/7/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var nextButton: UIButton!
    override func viewDidLoad() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextButton.layer.cornerRadius = 20
    }

    @IBAction func nextButton(_ sender: Any) {
          let vc = UIStoryboard(name: "LogInViewControler", bundle: nil).instantiateViewController(identifier: "LogInViewControler") as! LogInViewControler
                  navigationController?.pushViewController(vc, animated: true)
    }
    
}

