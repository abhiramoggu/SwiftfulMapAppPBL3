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
    @State private var isZStack1Active = true
    
    var body: some View {
        NavigationView {
           // List{
            VStack {
                
                Button(action: {
                    isZStack1Active.toggle()
                }) {
                    Text("Switch Maps")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    
                }
                
                if isZStack1Active {
                    ZStack{
                        mapLayer
                            .ignoresSafeArea()
                        
                        VStack(spacing: 70){
                            header
                                .padding()
                            Spacer()
                            
                            locationsPreviewStack
                        }
                        
                    }
                    //.navigationBarItems(leading: backButton) // Add this line
                    .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
                        LocationDetailView(location: location)
                    }
                }
                
                else {
                    ZStack{
                        
                        mapLayer2
                            .ignoresSafeArea()
                        
                        VStack(spacing: 0){
                            header2
                            Text("Fish Box Locations")
                            
                            Spacer()
                            
                            Text("Locations")
                        }
                    }
                }
                
            
                }
                .padding()
           // }
            //.listStyle(InsetGroupedListStyle())
        }
        //.padding()
        .background(Color.green)
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
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
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
    
    private var header2: some View {
        //VStack{
            Button(action: {
                print("hi")
            }) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            
            
       // }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View{
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: {location in
            //MapMarker(coordinate: location.coordinates, tint: .blue)
            MapAnnotation(coordinate: location.coordinates){
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1.5 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture{
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var mapLayer2: some View{
        Map(coordinateRegion: $vm.mapRegion)
    }
    
    private var locationsPreviewStack: some View{
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
