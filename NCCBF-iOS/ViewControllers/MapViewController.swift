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
    
    var mapAnnotations = [MKAnnotation]()
    
    let reuseIdentifier = "resueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupMapView()
        goToDefaultLocation()
        testAnnotations()
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) else {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            let rightButton = UIButton(type: .detailDisclosure)
            pinAnnotationView.rightCalloutAccessoryView = rightButton
            
            pinAnnotationView.canShowCallout = true
            pinAnnotationView.animatesDrop = true
            pinAnnotationView.pinTintColor = .purple
            
            return pinAnnotationView
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation else { return }
        print(annotation)
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
    
    private func testAnnotations() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = japantownCoordinate
        annotation.title = "Japantown"
        mapAnnotations.append(annotation)
        mapView.addAnnotations(mapAnnotations)
    }
}
