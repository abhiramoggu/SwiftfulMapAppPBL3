//
//  WeatherView.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/07/05.
//

/*
import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        VStack{
            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()
            Text(viewModel.temperature)
                .font(.system(size:70))
                .bold()
            Text(viewModel.weatherIcon)
                .font(.largeTitle)
                .padding()
            Text(viewModel.weatherDescription)
        }.onAppear(perform: viewModel.refresh)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherServices()))
    }
}
*/

import SwiftUI

struct WeatherView: View {

  @ObservedObject var viewModel: WeatherViewModel

  var body: some View {
    VStack {
      Text(viewModel.cityName)
        .font(.largeTitle)
        .padding()
      Text(viewModel.temperature)
        .font(.system(size: 70))
        .bold()
      Text(viewModel.weatherIcon)
        .font(.largeTitle)
        .padding()
      Text(viewModel.weatherDescription)
    }
    .alert(isPresented: $viewModel.shouldShowLocationError) {
      Alert(
        title: Text("Error"),
        message: Text("To see the weather, provide location access in Settings."),
        dismissButton: .default(Text("Open Settings")) {
          guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
          UIApplication.shared.open(settingsURL)
        }
      )
    }
    .onAppear(perform: viewModel.refresh)
  }
}


struct WeatherView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherView(viewModel: WeatherViewModel(weatherServices: WeatherService()))
  }
}
