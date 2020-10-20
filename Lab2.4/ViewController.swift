//
//  ViewController.swift
//  Lab2.4
//
//  Created by MAP on 20/10/20.
//  Copyright © 2020 ITE. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let anns = [MKPointAnnotation(), MKPointAnnotation()]
        anns[0].coordinate = CLLocationCoordinate2D(latitude: 1.290062, longitude: 103.855784)
        anns[0].title = "Esplanade"
        anns[0].subtitle = "Theatres on the Bay"
            
        anns[1].coordinate = CLLocationCoordinate2D(latitude: 1.403539, longitude: 103.790721)
        anns[1].title = "River Safari"
        anns[1].subtitle = "Wildlife and safari park"
            
        mapView.addAnnotations(anns)
        mapView.setCenter(anns[0].coordinate, animated: false)
        
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if annView == nil {
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
        }
        
        if (annotation.title)! == "Esplanade" {
            annView?.image = UIImage(named: "iconfinder_whatsapp_social_pin_2481144")
        }
        else if (annotation.title)! == "River Safari" {
            annView?.image = UIImage(named: "iconfinder_instagram_pin_logo_2481122")
        }
        annView!.canShowCallout = true
        return annView
    }

}

