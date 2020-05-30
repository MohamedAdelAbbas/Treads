//
//  Meter+Data+Time convert Ext.swift
//  Treads
//
//  Created by Mohamed Adel on 5/30/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import Foundation

extension Double {
    func metersToMiles(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return ((self / 1609.34) * divisor).rounded() / divisor
    }
}
