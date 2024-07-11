//
//  MapViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/22/24.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: NMFNaverMapView!
    @IBOutlet weak var userLocationButton: UIButton!
    
    private let locationManager = CLLocationManager()
    
    private let locationOverlayIcon = NMFOverlayImage(image: .checkmark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    private func setMapUI(){
        mapView.showLocationButton = false
        mapView.showCompass = true
        mapView.showZoomControls = false
        mapView.mapView.positionMode = .compass
        mapView.mapView.moveCamera(initialPosition)
    }
    @IBAction func userLocationButtonTapped(_ sender: UIButton) {
        
    }
}

// MARK: Generates Markers
extension MapViewController {
    func makeMarker(locationData: Location)->NMFMarker{
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: locationData.latitude, lng: locationData.longitude)
        marker.captionText = locationData.name
        return marker
    }
}
