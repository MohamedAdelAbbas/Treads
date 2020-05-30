//
//  LocationVC.swift
//  Treads
//
//  Created by Mohamed Adel on 5/30/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit
import  MapKit
class LocationVC: UIViewController, MKMapViewDelegate {
    
    var manager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.activityType = .fitness
    }
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager?.requestWhenInUseAuthorization()
        }
    }
    
}
