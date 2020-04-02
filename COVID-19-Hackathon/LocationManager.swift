//
//  LocationManager.swift
//  COVID-19-Hackathon
//
//  Created by Abdulelah Hajjar on 30/03/2020.
//  Copyright © 2020 Squadra. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
	let locationManager = CLLocationManager()
	override init() {
		super.init()
		locationManager.delegate = self
		locationManager.requestAlwaysAuthorization()
	}
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
	}
}
