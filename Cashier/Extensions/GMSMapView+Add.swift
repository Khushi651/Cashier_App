//
//  GMSMapView+Add.swift
//  PyramidGold
//
//  Created by MAC on 05/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import GoogleMaps


extension GMSMapView {

    //MARK:- Call API for polygon points

    func drawPolygon(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {

        let session = URLSession.shared

        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=\(Constant.GOOGLE_API_KEY)")!

        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in

            guard error == nil else {
                print(error!.localizedDescription)
                return
            }

            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {

                print("error in JSONSerialization")
                return

            }



            guard let routes = jsonResult?["routes"] as? [Any] else {
                return
            }

            guard let route = routes.first as? [String: Any] else {
                return
            }

            guard let legs = route["legs"] as? [Any] else {
                return
            }

            guard let leg = legs[0] as? [String: Any] else {
                return
            }

            guard let steps = leg["steps"] as? [Any] else {
                return
            }
              for item in steps {

                guard let step = item as? [String: Any] else {
                    return
                }

                guard let polyline = step["polyline"] as? [String: Any] else {
                    return
                }

                guard let polyLineString = polyline["points"] as? String else {
                    return
                }

                //Call this method to draw path on map
                DispatchQueue.main.async {
                    self.clear()
                    self.drawPath(with: polyLineString, source: source, destination: destination)
                }

            }
        })
        task.resume()
    }
    
    

    //MARK:- Draw Path

    private func drawPath(with points : String, source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D){
        
        DispatchQueue.main.async {
            
            let gmsMarkerSource = GMSMarker()
            gmsMarkerSource.position = source
            gmsMarkerSource.icon = GMSMarker.markerImage(with: UIColor.red)
            gmsMarkerSource.map = self
            
            let gmsMarkerDestination = GMSMarker()
            gmsMarkerDestination.position = destination
            gmsMarkerSource.icon = GMSMarker.markerImage(with: UIColor.green)
            gmsMarkerDestination.map = self
            
            let path = GMSPath(fromEncodedPath: points)
            let polyline = GMSPolyline(path: path)
            polyline.strokeWidth = 3.0
            polyline.strokeColor = .black
            polyline.map = self
            
            let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: source, coordinate: destination))
            self.moveCamera(cameraUpdate)
            let currentZoom = self.camera.zoom
            self.animate(toZoom: currentZoom - 1.4)
            
        }
    }
}
