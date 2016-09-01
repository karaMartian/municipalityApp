//
//  locationFormTVC.swift
//  myMunicipality
//
//  Created by Karabo Moloi on 2016/08/28.
//  Copyright © 2016 Karabo Moloi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class locationFormTVC: UITableViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
//    MARK: - Properties
    
    var catTitle: String!
    
    @IBOutlet weak var myLocationMV: MKMapView!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    var locationStr: String = ""
    
    var manager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = catTitle
        
        
//        location properties
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
        
//        map properties
        self.myLocationMV.delegate = self
        self.myLocationMV.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

   
    @IBAction func cancel(sender: UIBarButtonItem){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
//    MARK: - CLLocation delegate methods
    
//    did update locations
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        get last location
        let loc = locations.last
        
//        use last location to update current cooordinates
        let current = CLLocationCoordinate2D(latitude: (loc!.coordinate.latitude), longitude: (loc!.coordinate.longitude))
        
        
        //init geocode
        let geoCoder = CLGeocoder()
        
        //get current location
        let locate =  CLLocation(latitude: current.latitude, longitude: current.longitude)
        
        
        geoCoder.reverseGeocodeLocation(locate, completionHandler: {(placemarks, error) -> Void in
            
            var placemark: CLPlacemark
            
            if error != nil {
                print("ReverseGeocode failed: " + error!.localizedDescription)
            } else if (placemarks?.count > 0){
                placemark = (placemarks?[0])!
                
                if placemark.subThoroughfare == nil {
                    self.locationStr = ""
                } else {
                    self.locationStr = placemark.subThoroughfare! + " "
                }
                
                if placemark.thoroughfare == nil {
                    //put alert view instead, test first
                    self.locationStr = ""
                } else {
                    self.locationStr = self.locationStr + placemark.thoroughfare! + " "
                }
                
                if placemark.subAdministrativeArea != nil {
                    self.locationStr = self.locationStr + placemark.subAdministrativeArea! + ", "
                }else {
                    self.locationStr = self.locationStr + "Undefined"
                }
                
                if placemark.administrativeArea == nil {
                    self.locationStr = self.locationStr + ""
                } else {
                    self.locationStr = self.locationStr + placemark.administrativeArea!
                }

            }
            
            //        mapkit methods
            let region = MKCoordinateRegion(center: current, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            self.myLocationMV.setCenterCoordinate(current, animated: true)
            
            self.myLocationMV.setRegion(region, animated: true)
            
            
            
            self.manager.stopUpdatingLocation()
//            print(self.locationStr)
            self.locationLbl.text = self.locationStr
        })
    }
    
    
    
//    did fail with error
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location manger failed: " + error.localizedDescription)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
