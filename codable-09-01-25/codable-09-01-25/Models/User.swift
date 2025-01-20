//
//  User.swift
//  codable-09-01-25
//
//  Created by Лилия Д. Юмакаева on 08.01.2025.
//
import CoreLocation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoLocation
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

struct GeoLocation: Codable {
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitudeString = try container.decode(String.self, forKey: .latitude)
        self.latitude = CLLocationDegrees(latitudeString) ?? .zero
        let longitudeString = try container.decode(String.self, forKey: .longitude)
        self.longitude = CLLocationDegrees(longitudeString) ?? .zero
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy" // from nsdateformatter.com
//        let date = dateFormatter.date(from: latitudeString)!
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(String(latitude), forKey: .latitude)
        try container.encode(String(longitude), forKey: .longitude)
    }
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
