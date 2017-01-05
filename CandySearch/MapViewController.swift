//
//  MapViewController.swift
//  CandySearch
//
//  Created by Admin on 15.12.16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController ,MKMapViewDelegate
{
    @IBOutlet var mapView: MKMapView!
    
    
    var detailCity: City!
    
  

    override func viewDidLoad() {
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


