//
//  ViewController.swift
//  MapKit-Demo
//
//  Created by Reserveit Support on 15/5/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var mapView = MKMapView()
    var myMapView = UIView()
    
    lazy var myLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .clear
        lbl.textColor = .black
        lbl.font = UIFont(name: "Title 1", size: 20.0)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(_:)))
        mapView.addGestureRecognizer(tapGesture)
        initViews()
        renderMap()
    }
    
    private func initViews() {
        myLabel.frame = CGRect(x: 16, y: 70, width: view.frame.width-32, height: 50)
        myLabel.text = "Location View for ECB Square, Near Dhaka Cantonment"
        view.addSubview(myLabel)
        
        let width = Int(view.frame.width)
        myMapView.frame = CGRect(x: 16, y: Int(myLabel.frame.maxY)+20, width: width-32, height: Int(Double(width)/1.5))
        view.addSubview(myMapView)
        myMapView.layer.shadowColor = UIColor.black.cgColor
        myMapView.layer.shadowOpacity = 0.8
        
        mapView.frame = CGRect(x: 5, y: 5, width: Int(myMapView.frame.width)-10, height: Int(Double(width)/1.5)-10)
        myMapView.addSubview(mapView)
        
    }

    func renderMap(){
        let coordinate = CLLocationCoordinate2D(latitude: 23.8226983, longitude: 90.3941694);
        let span = MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015); // zooming area
        let region = MKCoordinateRegion(center: coordinate, span: span);
        mapView.setRegion(region, animated: true);
        let pin = MKPointAnnotation();
        pin.coordinate = coordinate;
        mapView.addAnnotation(pin);
    }

    @objc func handleMapTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            let location = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
            
            openMapsAppWithLocation(coordinate: coordinate)
        }
    }

}

extension ViewController: MKMapViewDelegate {
    func openMapsAppWithLocation(coordinate: CLLocationCoordinate2D) {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Near ECB Square"
        
        mapItem.openInMaps(launchOptions: nil)
    }
    
}
