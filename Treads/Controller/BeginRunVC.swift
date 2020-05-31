//
//  BeginRunVC.swift
//  Treads
//
//  Created by Mohamed Adel on 5/29/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
// 

import UIKit
import MapKit
import RealmSwift

class BeginRunVC: LocationVC {

    // MARK: Outlets
    
    @IBOutlet weak var runMapView: MKMapView!
    @IBOutlet weak var lastRunCloseBtn: UIButton!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var lastRunBGView: UIView!
    @IBOutlet weak var lastRunStack: UIStackView!
    // MARK: Properties
    
    // MARK: View Controller Life Cycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthStatus()
       // print("here are my Runs : \( Run.getAllRuns())")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        runMapView.delegate = self
        manager?.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupMapView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        manager?.stopUpdatingLocation()
    }
    
    func setupMapView() {
        if let overlay = addLastRunToMap() {
            if runMapView.overlays.count > 0 {
                runMapView.removeOverlays(runMapView.overlays)
            }
            runMapView.addOverlay(overlay)
            
            lastRunStack.isHidden = false
            lastRunBGView.isHidden = false
            lastRunCloseBtn.isHidden = false
        } else {
            lastRunStack.isHidden = true
            lastRunBGView.isHidden = true
            lastRunCloseBtn.isHidden = true
        }
    }
    
    func addLastRunToMap() -> MKPolyline? {
        guard let lastRun = Run.getAllRuns()?.first else { return nil }
        paceLabel.text = lastRun.pace.formatTimeDurationToString()
        distanceLabel.text = "\(lastRun.distance.metersToMiles(places: 2)) mi"
        durationLabel.text = lastRun.duration.formatTimeDurationToString()
        
        var coordinate =  [CLLocationCoordinate2D]()
        for location in lastRun.locations {
            coordinate.append(CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
        }
        return MKPolyline(coordinates: coordinate, count: lastRun.locations.count)
    }
    
    // MARK: Action
    @IBAction func lastRunCloseBtnPressed(_ sender: Any) {
        lastRunStack.isHidden = true
        lastRunBGView.isHidden = true
        lastRunCloseBtn.isHidden = true
    }
    
    @IBAction func locationCenterBtnPressed(_ sender: UIButton) {
    }
    
    // MARK: Class Methods
    
    
    // MARK: Self Defined Methods
    
}

extension BeginRunVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            checkLocationAuthStatus()
            runMapView.showsUserLocation = true
            runMapView.userTrackingMode = .follow
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
           let polyline = overlay as! MKPolyline
           let renderer = MKPolylineRenderer(polyline: polyline)
           renderer.strokeColor  = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
           renderer.lineWidth = 4
           return renderer
       }
}
