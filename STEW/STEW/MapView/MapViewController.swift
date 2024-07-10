//
//  MapViewController.swift
//  STEW
//
//  Created by 황채웅 on 6/22/24.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: NMFMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setMapUI()
    }
    
    private func setMapUI(){
        mapView.isNightModeEnabled = false
        mapView.positionMode = .compass
        
        let initialPosition = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.494913714426986, lng: 126.95651999073173), zoomTo: 16)
                mapView.moveCamera(initialPosition)
        
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.49463260514257, lng: 126.95777535856472)
        marker.captionText = "총학생회 제휴 업체"
        marker.mapView = mapView
        
        let infoWindow = NMFInfoWindow()
        let dataSource = NMFInfoWindowDefaultTextSource.data()
        dataSource.title = "서비스 콜라 줄게용!"
        infoWindow.dataSource = dataSource
        infoWindow.open(with: marker)
    }
    
}
