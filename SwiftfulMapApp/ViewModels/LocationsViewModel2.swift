//
//  LocationsViewModel2.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/07/12.
//
/*
import Foundation
import MapKit
import SwiftUI

class LocationsViewModel2: ObservableObject{
    
    // All loaded locations
    @ Published var locations2: [Location2]
    
    // Current Location on Map
    @ Published var mapLocation2: Location2 {
        didSet{
            updateMapRegion(location2: mapLocation2)
        }
    }
    
    // Current Region on Map
    @ Published var mapRegion2: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan2 = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show Map
    //@Published var showMapScreen2: Bool = false
    
    // Show List of Locations
    @ Published var showLocationsList2: Bool = false
    
    
    // SHow Location Detail Sheet
    @ Published var sheetLocation2: Location? = nil
    
    init() {
        let locations2 = LocationsDataService2.locations2
        self.locations2 = locations2
        self.mapLocation2 = locations2.first!
        self.updateMapRegion(location2: locations2.first!)
    }
    
    private func updateMapRegion(location2: Location2){
        withAnimation(.easeInOut){
            mapRegion2 = MKCoordinateRegion(
                center: location2.coordinates2,
                span: mapSpan2)
        }
    }
    /*
    func toggleMaps() {
        withAnimation(.easeInOut){
            showMapScreen2 = !showMapScreen2
        }
    }
    */
    func toggleLocationsList2() {
        withAnimation(.easeInOut) {
            showLocationsList2 = !showLocationsList2
        }
    }
    
    func showNextLocation2(location2: Location2) {
        withAnimation(.easeInOut) {
            mapLocation2 = location2
            showLocationsList2 = false
            
        }
    }
    
    func nextButtonPressed2(){
        
        // Get the current index
        guard let currentIndex2 = locations2.firstIndex(where: {$0 == mapLocation2}) else{
            print("Could not find current index in locations array!")
            return
        }
        
        
        // Check if the currentIndex is valid
        let nextIndex2 = currentIndex2 + 1
        guard locations2.indices.contains(nextIndex2) else{
            // Next index is not valid
            // Restart from 0
            guard let firstLocation2 = locations2.first else {return}
            showNextLocation2(location2: firstLocation2)
            return
        }
        
        //Next index is Valid
        let nextLocation2 = locations2[nextIndex2]
        showNextLocation2(location2: nextLocation2)
    }
    
}
*/
