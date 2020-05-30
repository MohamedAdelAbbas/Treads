//
//  BeginRunVC.swift
//  Treads
//
//  Created by Mohamed Adel on 5/29/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit
import MapKit
class BeginRunVC: LocationVC {

    // MARK: Outlets
    
    @IBOutlet weak var runMapView: MKMapView!
    // MARK: Properties
    
    // MARK: View Controller Life Cycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthStatus()
        runMapView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        manager?.stopUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        manager?.stopUpdatingLocation()
    }
    
    // MARK: Action
    
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
