//
//  Location.swift
//  Treads
//
//  Created by Mohamed Adel on 5/31/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import Foundation
import RealmSwift

class Location: Object {
    @objc dynamic public private(set) var latitude = 0.0
    @objc dynamic public private(set) var longitude = 0.0
    
    convenience init(latitude: Double, longitude: Double) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }
}
