//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/18.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
