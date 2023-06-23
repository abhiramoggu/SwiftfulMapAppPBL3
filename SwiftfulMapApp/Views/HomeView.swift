//
//  HomeView.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/22.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Home")
                    .font(.largeTitle)
                     
               
                
                    NavigationLink(destination: LocationsView()) {
                        
                        Text("Fish Locations")
                        //.font(.title)
                        //.fontWeight(.semibold)
                        //.foregroundColor(.white)
                        //.padding()
                        //.background(Color.blue)
                        //.cornerRadius(10)
                        
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                    }
                    NavigationLink(destination: LocationsView()) {
                        
                        Text("Box Locations")
                        //.font(.title)
                        //.fontWeight(.semibold)
                        //.foregroundColor(.white)
                        //.padding()
                        //.background(Color.blue)
                        //.cornerRadius(10)
                        
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                    }
                }
                Spacer()
                    
            }
            .padding()
            .navigationBarTitle("Home")
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewModel())
    }
}
