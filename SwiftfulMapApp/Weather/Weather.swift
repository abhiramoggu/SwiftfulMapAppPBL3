//
//  Weather.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/07/05.
//

/*
import Foundation

public struct Weather{
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse){
        city = response.name
        temperature = "(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
*/
import Foundation

public struct Weather {
  let city: String
  let temperature: String
  let description: String
  let iconName: String

  init(response: APIResponse) {
    city = response.name
    temperature = "\(Int(response.main.temp))"
    description = response.weather.first?.description ?? ""
    iconName = response.weather.first?.iconName ?? ""
  }
}
