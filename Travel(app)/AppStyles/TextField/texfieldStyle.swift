//
//  texfieldStyle.swift
//  Travel(app)
//
//  Created by anzori  on 2/25/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class texfieldStyle: UITextField {
    private let field: UIButton = {
        let button = UIButton()
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        Field()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
       Field()
    }
    func Field() {
        borderStyle = .none
    }
}

