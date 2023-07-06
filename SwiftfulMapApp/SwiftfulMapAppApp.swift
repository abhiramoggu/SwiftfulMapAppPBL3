//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/18.
//


/*
import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
        
        WindowGroup {
          let weatherService = WeatherServices()
          WeatherView(viewModel: WeatherViewModel(weatherService: weatherService))
        }
    }
    
}
*/

/*
 
 CHATGPT SUGEGSTION FOR COMBO
import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    @StateObject private var weatherService = WeatherServices()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    LocationsView()
                        .environmentObject(vm)
                }
                .tabItem {
                    Label("Locations", systemImage: "map")
                }
                
                NavigationView {
                    WeatherView(viewModel: WeatherViewModel(weatherService: weatherService))
                }
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun.fill")
                }
            }
        }
    }
}
*/

import SwiftUI

@main
struct WeatherApp: App {
  var body: some Scene {
    WindowGroup {
      let weatherServices = WeatherService()
      WeatherView(viewModel: WeatherViewModel(weatherServices: weatherServices))
    }
  }
}
