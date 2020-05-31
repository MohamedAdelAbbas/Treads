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
        runMapView.delegate = self
       // print("here are my Runs : \( Run.getAllRuns())")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        manager?.stopUpdatingLocation()
        getLastRun()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        manager?.stopUpdatingLocation()
    }
    func getLastRun() {
        guard let lastRun = Run.getAllRuns()?.first else {
            lastRunStack.isHidden = true
            lastRunBGView.isHidden = true
            lastRunCloseBtn.isHidden = true
            return }
        lastRunStack.isHidden = false
        lastRunBGView.isHidden = false
        lastRunCloseBtn.isHidden = false
        paceLabel.text = lastRun.pace.formatTimeDurationToString()
        distanceLabel.text = "\(lastRun.distance.metersToMiles(places: 2))mi"
        durationLabel.text = lastRun.duration.formatTimeDurationToString()
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
}
