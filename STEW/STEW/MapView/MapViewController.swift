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
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var universityButton: UIButton!
    @IBOutlet weak var collegeButton: UIButton!
    @IBOutlet weak var departmentButton: UIButton!
    private var selectedIndex: Int = 0
    private let locationOverlayIcon = NMFOverlayImage(image: .checkmark)
    private var markerArray: [NMFMarker] = []
    private var university,college,department: Unit?
    private var wholeBenefits,universityBenefits,collegeBenefits,departmentBenefits: [Location: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        loadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        setMapUI()
    }
    private func loadData(){
        university = decodeUnit(forKey: "university")
        college = decodeUnit(forKey: "college")
        department = decodeUnit(forKey: "department")
        universityBenefits = university?.benefits ?? [:]
        collegeBenefits = college?.benefits ?? [:]
        departmentBenefits = department?.benefits ?? [:]
        wholeBenefits = universityBenefits
        wholeBenefits?.merge(collegeBenefits ?? [:]) { (_, new) in new }
        wholeBenefits?.merge(departmentBenefits ?? [:]) { (_, new) in new }
    }
    private func setMapUI(){
        mapView.mapView.touchDelegate = self
        mapView.mapView.mapType = UserDefaults.standard.bool(forKey: "darkModeState") ? .navi : .basic
        mapView.mapView.setLayerGroup("NMF_LAYER_GROUP_BUILDING", isEnabled: false)
        mapView.mapView.isNightModeEnabled = UserDefaults.standard.bool(forKey: "isNightModeEnabled")
        mapView.showLocationButton = false
        mapView.showCompass = false
        mapView.showZoomControls = false
        mapView.showScaleBar = false
        mapView.mapView.positionMode = .compass
        
    }
    private func uiSet(){
        buttonStackView.arrangedSubviews.forEach { button in
            button.layer.cornerRadius = 10
        }
        moveCamera(locationData: soongsilUniversityDefaultPosition)
    }
    
    func loadMarkerData(){
        switch selectedIndex{
        case 0:
            for marker in markerArray{
                marker.mapView = nil
            }
            if let universityBenefits = universityBenefits {
                for location in universityBenefits.keys {
                    makeMarker(locationData: location, benefit: universityBenefits[location] ?? "")
                }
            }
        case 1:
            for marker in markerArray{
                marker.mapView = nil
            }
            if let collegeBenefits = collegeBenefits {
                for location in collegeBenefits.keys {
                    makeMarker(locationData: location, benefit: collegeBenefits[location] ?? "")
                }
            }
        case 2:
            for marker in markerArray{
                marker.mapView = nil
            }
            if let departmentBenefits = departmentBenefits {
                for location in departmentBenefits.keys {
                    makeMarker(locationData: location, benefit: departmentBenefits[location] ?? "")
                }
            }
        default:
            return
        }
    }
    @IBAction func universityButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
        selectedIndex = 0
        universityButton.backgroundColor = .mainPurple
        collegeButton.backgroundColor = .darkGray
        departmentButton.backgroundColor = .darkGray
        loadMarkerData()
    }
    @IBAction func collegeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
        selectedIndex = 1
        universityButton.backgroundColor = .darkGray
        collegeButton.backgroundColor = .mainPurple
        departmentButton.backgroundColor = .darkGray
        loadMarkerData()
    }
    @IBAction func departmentButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
        selectedIndex = 2
        universityButton.backgroundColor = .darkGray
        collegeButton.backgroundColor = .darkGray
        departmentButton.backgroundColor = .mainPurple
        loadMarkerData()
    }
    
}

extension MapViewController:NMFMapViewTouchDelegate {
    func makeMarker(locationData: Location, benefit: String){
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: locationData.latitude, lng: locationData.longitude)
        marker.captionText = locationData.name
        marker.iconImage = NMFOverlayImage(name: "marker")
        marker.captionText = locationData.name
        marker.captionTextSize = 13
        marker.width = 40
        marker.height = 40
        marker.iconPerspectiveEnabled = true
        // 마커를 탭하면:
        let handler = { (overlay: NMFOverlay) -> Bool in
            self.dismiss(animated: true)
            let VC = MapInfoViewController()
            VC.location = locationData
            VC.modalPresentationStyle = .pageSheet
            VC.sheetPresentationController?.detents = [.custom(identifier: .init("customDetent"), resolver: { context in
                return 200
            }), .large()]
            VC.sheetPresentationController?.largestUndimmedDetentIdentifier = .large
            VC.sheetPresentationController?.prefersGrabberVisible = true
            VC.preferredContentSize = CGSize(width: self.mapView.bounds.width, height: 189)
            self.present(VC, animated: true)
            return true
        };
        marker.touchHandler = handler
        marker.mapView = mapView.mapView
        markerArray.append(marker)
    }
    func moveCamera(locationData: Location){
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationData.latitude, lng: locationData.longitude), zoomTo: 15)
        cameraUpdate.animation = .fly
        mapView.mapView.moveCamera(cameraUpdate)
    }
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        self.dismiss(animated: true)
    }
    
}
