//
//  MapViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewControler: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "MapCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MapCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        locationManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Request location authorization
        locationManager.requestWhenInUseAuthorization()
    }
    
    func calculateItemSize(for collectionView: UICollectionView) -> CGSize {
        return CGSize(width: 370, height: 200)
    }
}

extension MapViewControler: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCollectionViewCell", for: indexPath)  as! MapCollectionViewCell
        let size = calculateItemSize(for: collectionView)
        cell.image.translatesAutoresizingMaskIntoConstraints = false
        cell.image.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        cell.image.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return cell
    }
    
}
extension MapViewControler: UICollectionViewDelegate{
    
}
extension MapViewControler: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateItemSize(for: collectionView)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
}

//location
extension MapViewControler: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            // Start updating location
            manager.startUpdatingLocation()
            mapView.showsUserLocation = true
            mapView.backgroundColor = .red
            
        case .denied, .restricted:
            // Handle denied or restricted status
            print("Location access denied or restricted")
            
        case .notDetermined:
            // Do nothing
            break
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user's location: \(error.localizedDescription)")
    }

}
