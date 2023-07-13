//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Red Fish",
            cityName: "Near Chinai",
            coordinates: CLLocationCoordinate2D(latitude: 35.442491, longitude: 136.066161),
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Blue Fish",
            cityName: "Near Hikone",
            coordinates: CLLocationCoordinate2D(latitude: 35.3219726, longitude: 136.2142441),
            description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
            imageNames: [
                "rome-pantheon-1",
                "rome-pantheon-2",
                "rome-pantheon-3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        Location(
            name: "Green Fish",
            cityName: "Near Imazu",
            coordinates: CLLocationCoordinate2D(latitude: 35.3885049, longitude: 136.1053397),
            description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
            imageNames: [
                "rome-trevifountain-1",
                "rome-trevifountain-2",
                "rome-trevifountain-3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "Yellow Fish",
            cityName: "Near Hira",
            coordinates: CLLocationCoordinate2D(latitude: 35.1980793, longitude: 135.9694026),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed 'La dame de fer', it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair and was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        
        Location(
            name: "Violet Fish",
            cityName: "Near Nara",
            coordinates: CLLocationCoordinate2D(latitude: 35.003663, longitude: 135.892481),
            description: "Devi",
            imageNames: [
                "paris-louvre-1",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Fish Box Location 1",
            cityName: "Kotsugi",
            coordinates: CLLocationCoordinate2D(latitude: 35.059813, longitude: 135.90475),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "fishbox",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Fish Box Location 2",
            cityName: "Kotsugi",
            coordinates: CLLocationCoordinate2D(latitude: 35.059813, longitude: 135.90475),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "fishbox",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Fish Box Location 3",
            cityName: "Kotsugi",
            coordinates: CLLocationCoordinate2D(latitude: 35.059813, longitude: 135.90475),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "fishbox",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Fish Box Location 4",
            cityName: "Kotsugi",
            coordinates: CLLocationCoordinate2D(latitude: 35.059813, longitude: 135.90475),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "fishbox",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Fish Box Location 5",
            cityName: "Kotsugi",
            coordinates: CLLocationCoordinate2D(latitude: 35.059813, longitude: 135.90475),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "fishbox",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre")
    ]
    
}
 

/*
import Foundation
import MapKit

class LocationsDataService {
    static let locations: [Location] = CSVParser.parseCSV()
}
*/
/*
import Foundation
import MapKit

class LocationsDataService {
    
    static var locations: [Location] = [] // Empty array
    
    static func loadLocationsFromCSV() {
        guard let csvURL = Bundle.main.url(forResource: "locations", withExtension: "csv") else {
            fatalError("Unable to find locations.csv file")
        }
        
        do {
            let csvData = try String(contentsOf: csvURL, encoding: .utf8)
            let csvRows = csvData.components(separatedBy: "\n")
            
            for row in csvRows.dropFirst() { // Skip the header row
                let columns = row.components(separatedBy: ",")
                
                guard columns.count == 8 else {
                    continue // Skip rows with incorrect number of columns
                }
                
                let name = columns[0]
                let cityName = columns[1]
                let latitude = Double(columns[2]) ?? 0.0
                let longitude = Double(columns[3]) ?? 0.0
                let description = columns[4]
                let imageNames = columns[5..<8].map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                let link = columns[8]
                
                let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let location = Location(name: name, cityName: cityName, coordinates: coordinates, description: description, imageNames: imageNames, link: link)
                locations.append(location)
            }
        } catch {
            fatalError("Error loading locations from CSV: \(error)")
        }
    }
    
}

// Call the function to load locations from the CSV file
LocationsDataService.loadLocationsFromCSV()
*/
