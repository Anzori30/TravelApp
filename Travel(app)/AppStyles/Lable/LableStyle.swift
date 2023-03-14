//
//  LableStyle.swift
//  Travel(app)
//
//  Created by macbook on 10.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit


class LableStyle: UILabel {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        color()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        color()
    }
    func color() {
        textColor = UIColor(named: "ButtonColor_Orange")
        
    }
}
