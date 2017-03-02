//
//  MapViewController.swift
//  CandySearch
//
//  Created by Admin on 15.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController ,MKMapViewDelegate , CLLocationManagerDelegate
{
   
    
    @IBAction func showMyLocation(_ sender: Any) {
        
        getlocation()
    }
    
    @IBAction func typeMap(_ sender: UISegmentedControl) {
       
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default: // or case 2
            mapView.mapType = .hybrid
        }
 
    }
    
   
    //Map
    @IBOutlet var mapView: MKMapView!
    
    
    
    @IBAction func updaeLocationUser(_ sender: AnyObject) {
        coreLocationManager.delegate = self
        locationManager = LocationManager.sharedInstance
        let autorizationCode = CLLocationManager.authorizationStatus()
        if autorizationCode == CLAuthorizationStatus.notDetermined && coreLocationManager.responds(to: "reqestAlwaysAuthorization") || coreLocationManager.responds(to: "reqestWhenInUseAuthorization")
        {
            if Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription")  != nil
            {
                coreLocationManager.requestWhenInUseAuthorization()
            }
            else
            {
                print("No description provided")
            }
        }
        else
        {
            getlocation()
        }
        

    }
    var coreLocationManager = CLLocationManager()
    var locationManager :LocationManager!
    
    var detailCity: City!
    func getlocation()
    {
       locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) ->()  in
        self.displayLocation(location: CLLocation(latitude: latitude ,longitude: longitude))
     /*    let bsuCSCampusLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
      
    mapView.setRegion(MKCoordinateRegion(bsuCSCampusLocation), animated: true)
        */}
        
    }
    func displayLocation(location: CLLocation)
    {
        //set Region
      mapView.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude) , MKCoordinateSpanMake(0.05, 0.05)), animated: true)
        
        let locationPinCoord = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationPinCoord
        
        mapView.addAnnotation(annotation)
        mapView.showAnnotations([annotation], animated: true)
        
        
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.notDetermined || status != CLAuthorizationStatus.denied || status != CLAuthorizationStatus.restricted
        {
            getlocation()
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
  
        //задаем масштаб приближения карты
       let ditanceSpan :CLLocationDistance = 4000
        //получаем координаты для отображения на карте
        let bsuCSCampusLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees(detailCity.coordinateX), CLLocationDegrees(detailCity.coordinateY))
        //задаем регио отображения карты
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(bsuCSCampusLocation, ditanceSpan, ditanceSpan), animated: true)
 
        //создадим аннотацию
    let annotation = MKPointAnnotation()
        
    
        
        annotation.coordinate = bsuCSCampusLocation
        annotation.title = detailCity.name
        
      
        mapView.showAnnotations([annotation], animated: true)
        mapView.selectAnnotation(annotation, animated: true)
 
 }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategory"{
            let destinationViewController = segue.destination as!  CategoryViewController
            destinationViewController.detailCity = detailCity
        }
    }
    
    }
