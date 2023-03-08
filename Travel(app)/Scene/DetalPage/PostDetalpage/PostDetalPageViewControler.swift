//
//  PostDetalPageViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 3/2/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class PostDetalPageViewControler: UIViewController{
    
    @IBOutlet weak var forgradiant: UIViewStyle!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //gradiant
        ViewtopGradiant(imageTopView: forgradiant, mainView: view)
    }
    
     func calculateItemSize(for collectionView: UICollectionView) -> CGSize {
         let itemWidth = 200
         let itemHeight = 300
         return CGSize(width: itemWidth, height: itemHeight)
     }
    deinit {
        print("deinited PostDetalPageViewControler")
    }
}
extension PostDetalPageViewControler: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)  as! CollectionViewCell
        let size = calculateItemSize(for: collectionView)
        cell.image.translatesAutoresizingMaskIntoConstraints = false
        cell.image.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        cell.image.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return cell
    }
    
}
extension PostDetalPageViewControler: UICollectionViewDelegate{
    
}
extension PostDetalPageViewControler: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateItemSize(for: collectionView)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
}








