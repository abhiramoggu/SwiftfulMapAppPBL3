//
//  File.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/18.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject{
    
    // All loaded locations
    @ Published var locations: [Location]
    
    // Current Location on Map
    @ Published var mapLocation: Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current Region on Map
    @ Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //Show Map
    //@Published var showMapScreen2: Bool = false
    
    // Show List of Locations
    @ Published var showLocationsList: Bool = false
    
    
    // SHow Location Detail Sheet
    @ Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    /*
    func toggleMaps() {
        withAnimation(.easeInOut){
            showMapScreen2 = !showMapScreen2
        }
    }
    */
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
            
        }
    }
    
    func nextButtonPressed(){
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            print("Could not find current index in locations array!")
            return
        }
        
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            // Next index is not valid
            // Restart from 0
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        //Next index is Valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
}
