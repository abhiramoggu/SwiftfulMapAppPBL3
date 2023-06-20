//
//  LocationsView.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/18.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    /*

    struct MapView: View {
        @State private var coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        
        var body: some View {
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))))
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                        .frame(width: 40, height: 40)
                )
        }
    }
   

    struct ContentView: View {
        var body: some View {
            MapView()
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
     */
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
            Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: {location in
                MapMarker(coordinate: location.coordinates)
                    

            })
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                    .padding()
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3),
                                        radius:20)
                                .padding()
                                .transition(.asymmetric(
                                   insertion: .move(edge: .trailing),
                                   removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees:
                                                    vm.showLocationsList ? 180 : 0))
                    }
            }
            if vm.showLocationsList{
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
