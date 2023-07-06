//
//  WeatherViewModel.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/07/05.
//


/*
import Foundation

private let defaultIcon = "❓"

private let iconMap = [
    "Drizzle" : "🌦️",
    "Thunderstorm" : "⛈️",
    "Rain" : "🌧️",
    "Snow" : "🌨️",
    "Clear" : "☀️",
    "Clouds" : "☁️",
]


public class WeatherViewModel: ObservableObject{
    
    @Published var cityName: String = "City Name"
    
    @Published var temperature: String = "--"
    
    @Published var weatherDescription: String = "--"
    
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherServices
    
    public init(weatherService: WeatherServices) {
        self.weatherService = weatherService
    }
    
    public func refresh(){
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)C"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}

*/

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
  "Drizzle" : "🌧",
  "Thunderstorm" : "⛈",
  "Rain": "🌧",
  "Snow": "❄️",
  "Clear": "☀️",
  "Clouds" : "☁️",
]

class WeatherViewModel: ObservableObject {
  @Published var cityName: String = "City Name"
  @Published var temperature: String = "--"
  @Published var weatherDescription: String = "--"
  @Published var weatherIcon: String = defaultIcon
  @Published var shouldShowLocationError: Bool = false

  public let weatherServices: WeatherService

  init(weatherServices: WeatherService) {
    self.weatherServices = weatherServices
  }

  func refresh() {
    weatherServices.loadWeatherData { weather, error in
      DispatchQueue.main.async {
        if let _ = error {
          self.shouldShowLocationError = true
          return
        }

        self.shouldShowLocationError = false
        guard let weather = weather else { return }
        self.cityName = weather.city
        self.temperature = "\(weather.temperature)ºC"
        self.weatherDescription = weather.description.capitalized
        self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
      }
    }
  }
}
