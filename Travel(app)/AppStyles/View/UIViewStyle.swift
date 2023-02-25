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
        if savedColor == "0"{
           backgroundColor = UIColor(red: 0.106, green: 0.196, blue: 0.196, alpha: 1)
        }
        else if savedColor == "1"{
            backgroundColor = UIColor(red: 0.992, green: 0.91, blue: 0.816, alpha: 1)
        }
        else{
            backgroundColor = UIColor.systemBackground
        }
    }
}
