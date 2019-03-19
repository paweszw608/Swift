//
//  FourthViewController.swift
//  Lab3
//
//  Created by ZUI on 07.01.2019.
//  Copyright © 2019 JDBG. All rights reserved.
//

import UIKit
import CoreLocation

class FourthViewController: UIViewController, CLLocationManagerDelegate {

    // dlugosc
    @IBOutlet weak var longtitude: UILabel!
    // szerokosc
    @IBOutlet weak var latitude: UILabel!
    // adres
    @IBOutlet weak var adress: UILabel!
    
    var location: CLLocation?
    let locationManager = CLLocationManager()
    
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false;
    var lastGeocodingError: Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationName(from placemark: CLPlacemark) -> String {
        return "\(placemark.subThoroughfare ?? "") \(placemark.thoroughfare ?? "")\n" +
    "\(placemark.locality ?? "") \(placemark.administrativeArea ?? "") " +
        "\(placemark.postalCode ?? "")"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("didUpdateLocations \(newLocation)")
        location = newLocation
        if let location = location{
            longtitude.text = String(format: "%.8f",location.coordinate.longitude)
            latitude.text = String(format: "%.8f", location.coordinate.latitude)
            
        }
    }
    
    
    @IBAction func getLocation()
    {
        let authStatus = CLLocationManager.authorizationStatus(); if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }

    
    @IBAction func getAdress(_ sender: Any) {
        // Reverse Geocoding
        getLocation()
        if !performingReverseGeocoding {
            print(" Wykonuję geokodowanie ")
            performingReverseGeocoding = true
            geocoder.reverseGeocodeLocation(location!, completionHandler: {
                
                placemarks, error in print("*** Znalazłem miejsce: \(String(describing: placemarks)), error: \(String(describing: error))")
                
                if error == nil, let p = placemarks, !p.isEmpty {
                    self.placemark = p.last!
                    self.adress.text = self.locationName(from: self.placemark!)
                    self.performingReverseGeocoding = false
                } else { self.placemark = nil }
            })
        }
    }
    

    

}
