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
        }
        
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
//функция изменения локации
 /*   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let myLiocation :CLLocationCoordinate2D =  CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let span :MKCoordinateSpan = MKCoordinateSpanMake(0.001,0.001)

        let region : MKCoordinateRegion = MKCoordinateRegionMake(myLiocation, span)
        mapView.setRegion(region,animated:  true)
        
        self.mapView.showsUserLocation = true
        
        
    }*/
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      //  mapView.delegate = self
      
        let ditanceSpan :CLLocationDistance = 4000
        let bsuCSCampusLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees(detailCity.coordinateX), CLLocationDegrees(detailCity.coordinateY))
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(bsuCSCampusLocation, ditanceSpan, ditanceSpan), animated: true)
            
        let bsuCSClassPin = BSUAnnotation(title: detailCity.name, coordinate: bsuCSCampusLocation)
        mapView.addAnnotation(bsuCSClassPin)
 
        let identifier = "MyPin"
        let  annotationView = MKPinAnnotationView(annotation: bsuCSClassPin, reuseIdentifier: identifier )
        let lefIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        lefIconView.image = UIImage(named: detailCity.name + ".jpg")
        annotationView.leftCalloutAccessoryView = lefIconView
        
               /* coreLocationManager.desiredAccuracy = kCLLocationAccuracyBest //мы уже находимся на какой то точке в карте но нам необходимо найти именно ту в которой мы находимся т.е. точку лушче чем сейчас
        coreLocationManager.requestWhenInUseAuthorization() //дя того чтобы использовать геолокацию тольк при использовании приложения
        coreLocationManager.startUpdatingLocation() //обновляем*/
        
     //   locationManager = locationManager(<#T##manager: CLLocationManager##CLLocationManager#>, didUpdateLocations: <#T##[CLLocation]#>)
/*let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(detailCity.coordinate, completionHandler: {placemarks, error in
        if error != nil  //                     .coordinate
        { //проверяем на ошибку
            print(error)
            return
            } // если место сущетвует то создаем массив объектов и выбираем первый для отображения
            if let placemarks = placemarks{
              let  placemark = placemarks[0]
 
            let annotation = MKPointAnnotation()
            annotation.title = self.detailCity.name
            if let location = placemark.location {
                annotation.coordinate = location.coordinate
                
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
                }}
 
            
        })
   */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   /* func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
    

        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let lefIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        lefIconView.image = UIImage(named: detailCity.name + ".jpg")
        annotationView?.leftCalloutAccessoryView = lefIconView
        
        return annotationView
    }
    
*/
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


