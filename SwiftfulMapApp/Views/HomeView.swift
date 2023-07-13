//
//  HomeView.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/22.
//

/*
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        NavigationView{
            VStack (spacing: 500){
                Text("Home")
                    .font(.largeTitle)
                    //.alignment(Center)
                    NavigationLink(destination: LocationsView()) {
                        
                        Text("Maps View")
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .padding()
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    
                    }
                }
            .padding()
            .background(Color.yellow)
            .navigationBarTitle("Home", displayMode: .inline)
            
            }
    
            
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewModel())
    }
}
*/
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                
                NavigationLink(destination: LocationsView()) {
                    Text("Fishing Maps View")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                }
                
                NavigationLink(destination: LocationsView()) {
                    Text("Boxes Maps View")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.yellow)
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewModel())
    }
}
