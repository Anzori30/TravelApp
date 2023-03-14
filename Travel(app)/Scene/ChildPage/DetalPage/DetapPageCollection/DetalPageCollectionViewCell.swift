//
//  DetalPageCollectionViewCell.swift
//  Travel(app)
//
//  Created by macbook on 14.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class DetalPageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var star_lable: UILabel!
    @IBOutlet weak var person_lable: UILabel!
    @IBOutlet weak var price_lable: UILabel!
    @IBOutlet weak var namle_lable: UILabel!
    @IBOutlet weak var detalinfo_lable: UILabel!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        detalinfo_lable.isHidden = true
    }

}
