//
//  MapsController.swift
//  Task1.2Lab9
//
//  Created by Andrey Kuksa on 5/26/21.
//  Copyright © 2021 Ivan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import CoreData

class MapsController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    let locManger = CLLocationManager();
    var museums = [NSManagedObject]()
    var items: [Museums] = []
    let container =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMuseums()
        locManger.delegate=self
        locManger.desiredAccuracy = kCLLocationAccuracyBest
        locManger.distanceFilter=kCLLocationAccuracyHundredMeters
       
       
        map.delegate = self
        map.userTrackingMode = .follow
        map.showsUserLocation = true
        
        setupData()
        
        locManger.startUpdatingLocation();
    }
    
    func fetchMuseums(){
        try! self.items = container.fetch(Museums.fetchRequest())
      
        try! container.save()
    }
    
    func setupData() {
        for museum in self.items {
            addLocation(name: museum.name!, coordinateFirst: museum.firstCoordinate as! Double, coordinateSecond: museum.secondCoordinate as! Double)
        }
    }
     
    func addLocation(name: String, coordinateFirst: Double!, coordinateSecond: Double!){
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            let locationCoordinates = CLLocationCoordinate2DMake(coordinateFirst, coordinateSecond)
            let locationRadius = 500.0
     
            // 3. setup region
            let place = CLCircularRegion(center: CLLocationCoordinate2D(latitude: locationCoordinates.latitude,
                longitude: locationCoordinates.longitude), radius: locationRadius, identifier: name)
            locManger.startMonitoring(for: place)
     
            let pointAnnotation = MKPointAnnotation()
            pointAnnotation.coordinate = locationCoordinates;
            pointAnnotation.title = "\(name)";
            map.addAnnotation(pointAnnotation)
     
            let locationCircle = MKCircle(center: locationCoordinates, radius: locationRadius)
            map.addOverlay(locationCircle)
        }
    }
    
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circleDrawer = MKCircleRenderer(overlay: overlay)
            circleDrawer.strokeColor = UIColor.red
            circleDrawer.lineWidth = 1.0
            return circleDrawer
        }
}
    



