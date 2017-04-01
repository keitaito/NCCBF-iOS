//
//  MapViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/1/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupMapView()
        goToDefaultLocation()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        title = "Map"
    }
    private func setupMapView() {
        mapView.delegate = self
    }
    
    private func goToDefaultLocation() {
        mapView.setRegion(MKCoordinateRegion(center: japantownCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)), animated: true)
    }
}
