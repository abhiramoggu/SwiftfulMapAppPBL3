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
            List{
                VStack {
                    Button(action: {
                        isZStack1Active.toggle()
                    }) {
                        Text("Switch Maps")
                            .foregroundColor(.primary)
                            .padding()
                    }
                    if isZStack1Active {
                        ZStack{
                            mapLayer
                                .ignoresSafeArea()
                            VStack(spacing: 0){
                                header
                                    .padding()
                                Text("Fish Location")
                                    .foregroundColor(.primary)
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
                            
                            mapLayer
                                .ignoresSafeArea()
                            /*
                            VStack(spacing: 0){
                                header
                                    .padding()
                                Text("Fish Boxes")
                                    .foregroundColor(.primary)
                                    .padding()
                                Spacer()
                                locationsPreviewStack
                             */
                            }
                            
                        }
                        //.navigationBarItems(leading: backButton) // Add this line
                        //.sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
                            //LocationDetailView(location: location)
                        //}
                    //}
                    
                }
                
            }
            .listStyle(InsetGroupedListStyle())
        }
        .padding()
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
    
    private var backButton: some View {
            Button(action: {
                vm.showLocationsList = false
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.primary)
                    .imageScale(.large)
                    .padding()
            }
        }
}
