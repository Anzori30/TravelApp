//
//  SettingPage.swift
//  Travel(app)
//
//  Created by anzori  on 2/23/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class SettingPage: UIViewController {
    let defaults = UserDefaults.standard
     var hasBackgroundColorChanged = false
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bacgroundColor(view: view)
    }
    @IBAction func colorControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
             defaults.set("0", forKey: "backgroundColor")
            sender.selectedSegmentTintColor = .red
             hasBackgroundColorChanged = true
           (tabBarController as? TabBarViewControler)?.start()
        case 1:
            defaults.set("1", forKey: "backgroundColor")
             hasBackgroundColorChanged = true
           (tabBarController as? TabBarViewControler)?.start()
        case 2:
            hasBackgroundColorChanged = true
            defaults.set("2", forKey: "backgroundColor")
        default :
            break
        }
        bacgroundColor(view: view)
    }
    
    @IBAction func save_button(_ sender: Any) {
        spiner.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if  self.hasBackgroundColorChanged {
                
                self.navigationController?.popViewController(animated: true)
            }
            else{
              let alert = UIAlertController(title: "Warning", message: "Please change something or return back page", preferredStyle: .alert)
                let returns = UIAlertAction(title: "Return", style: .default) { (action) in
                    self.navigationController?.popViewController(animated: true)
                }
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.spiner.stopAnimating()
                }
                alert.addAction(returns)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
           
        }
    }

    deinit {
        print("deinited SettingPage")
    }
}


