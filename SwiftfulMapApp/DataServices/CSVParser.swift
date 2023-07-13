//
//  CSVParser.swift
//  SwiftfulMapApp
//
//  Created by Abhiram Oggu on 2023/07/12.
//
/*
import Foundation
import MapKit

class CSVParser {
    
    static func parseCSV() -> [Location] {
        var locations: [Location] = []
        
        if let csvPath = Bundle.main.path(forResource: "locations", ofType: "csv") {
            do {
                let csvData = try String(contentsOfFile: csvPath, encoding: .utf8)
                let rows = csvData.components(separatedBy: .newlines)
                
                for row in rows {
                    let columns = row.components(separatedBy: ",")
                    
                    if columns.count == 4 {
                        let name = columns[0].trimmingCharacters(in: .whitespacesAndNewlines)
                        let cityName = columns[1].trimmingCharacters(in: .whitespacesAndNewlines)
                        let latitudeString = columns[2].trimmingCharacters(in: .whitespacesAndNewlines)
                        let longitudeString = columns[3].trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        if let latitude = Double(latitudeString), let longitude = Double(longitudeString) {
                            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                            let location = Location(name: name, cityName: cityName, coordinates: coordinates, description: "", imageNames: [], link: "")
                            locations.append(location)
                        }
                    }
                }
            } catch {
                print("Error reading CSV file: \(error)")
            }
        }
        
        return locations
    }
    
}
*/
