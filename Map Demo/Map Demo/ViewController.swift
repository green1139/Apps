//
//  ViewController.swift
//  Map Demo
//
//  Created by Siddhant Pagariya on 6/29/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    @IBOutlet var gestureRecognizer: UILongPressGestureRecognizer!
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        /**let latitude:CLLocationDegrees = 42.217819
        let longitude:CLLocationDegrees = -85.657558
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        **/
        
        /**let latitude: CLLocationDegrees = 37.3320
        let longitude: CLLocationDegrees = -122.0296
        let latDelta:CLLocationDegrees = 0.002
        let longDelta:CLLocationDegrees = 0.002
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Apple, California"
        annotation.subtitle = "This is Apple in CA, USA."
        map.addAnnotation(annotation)
        **/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let location:CLLocation = locations[0] as CLLocation
        ///let latitude = location.coordinate.latitude
        ///let longitude = location.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.001
        let longDelta:CLLocationDegrees = 0.001
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
        map.setRegion(region, animated: true)
    }
    @IBAction func longPress(sender: AnyObject) {
        print("Gesture recognized")
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        let coordinate:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Location"
        annotation.subtitle = "You added this pin."
        map.addAnnotation(annotation)
    }
}

