//
//  DetalPagePhotoCollectionViewCell.swift
//  Travel(app)
//
//  Created by macbook on 15.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class DetalPagePhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lable.isHidden = true
    }

}
