//
//  HomeViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class HomeViewControler: UIViewController {
   
    @IBOutlet weak var username: UILabel!
    @IBOutlet private weak var userImage: UIButton!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collection.dataSource = self
        collection.delegate = self
        collection.isPagingEnabled = true
        // bottom borders
        addBottomBorder(to: stackView)
    }
    override func viewWillAppear(_ animated: Bool) {
       //bacground color
        bacgroundColor(view: view)
    }

    
    
    func calculateItemSize(for collectionView: UICollectionView) -> CGSize {
        let itemWidth = collectionView.frame.width - 80
        let itemHeight = collectionView.frame.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    
    
}




extension HomeViewControler: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)  as! CollectionViewCell
        let size = calculateItemSize(for: collectionView)
        cell.image.translatesAutoresizingMaskIntoConstraints = false
        cell.image.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        cell.image.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return cell
    }
    
}
extension HomeViewControler: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "PostDetalPageViewControler", bundle: nil).instantiateViewController(identifier: "PostDetalPageViewControler") as! PostDetalPageViewControler
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeViewControler: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateItemSize(for: collectionView)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
}

