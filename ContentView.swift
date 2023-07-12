//
//  ContentView.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
        
            .environmentObject(LocationsViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

