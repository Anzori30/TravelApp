//
//  DetalPageViewController.swift
//  Travel(app)
//
//  Created by macbook on 14.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class DetalPageViewController : UIViewController{
    @IBOutlet weak var imageCollection: UICollectionView!
 
    @IBOutlet weak var bacgraund_image: UIImageView!
    @IBOutlet weak var collection_Info: UICollectionView!
    var datasource: DetalPageViewControllerDatasorce!
    @IBOutlet weak var forgradiant: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        ViewtopGradiant(imageTopView: forgradiant, mainView: view)
        
    }

    func configure(){
        datasource = DetalPageViewControllerDatasorce(with: collection_Info, collectionImage: imageCollection)
        datasource?.delegate = self
    }
    @IBAction func on_Detal(_ sender: Any) {
       
    }
    
    @IBAction func on_about(_ sender: Any) {
        
    }
}
extension DetalPageViewController: DetalPageViewControllerDelegate{
    func click(image: UIImage) {
        bacgraund_image.image = image
    }
}
