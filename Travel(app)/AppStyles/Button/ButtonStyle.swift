//
//  ButtonCornerStyle.swift
//  Travel(app)
//
//  Created by anzori  on 2/25/23.
//  Copyright © 2023 anzori . All rights reserved.
//
import UIKit

class buttonStyle: UIButton {
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        button()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        button()
    }
    func button() {
        layer.cornerRadius = 20
        backgroundColor = UIColor(named: "ButtonColor_Orange")
    }
}
