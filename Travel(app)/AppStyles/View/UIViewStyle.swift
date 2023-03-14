//
//  UIViewStyle.swift
//  Travel(app)
//
//  Created by anzori  on 2/25/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class UIViewStyle: UIView {
    private let view: UIView = {
        let uiview = UIView()
        return uiview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        color()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        color()
    }
    func color() {
        let defaults = UserDefaults.standard
        let savedColor = defaults.string(forKey: "backgroundColor") ?? "white"
        
        if savedColor == "0" {
            backgroundColor =  UIColor(named: "BackGroundColor_Green")!
        }
        else if savedColor == "1" {
            backgroundColor =  UIColor(named: "BackGroundColor_Orange")!
        }
        else {
            if HomeViewControler().traitCollection.userInterfaceStyle == .dark || LogInViewControler().traitCollection.userInterfaceStyle == .dark {
                backgroundColor =  UIColor(named: "BackGroundColor_Green")!
            } else {
                  backgroundColor =  UIColor(named: "BackGroundColor_Orange")!
            }
        }
//        let view = Bundle.main.loadNibNamed("common", owner: self, options: nil)?.first as! UIView
//              view.frame = self.bounds
//              self.addSubview(view)
    }
}
