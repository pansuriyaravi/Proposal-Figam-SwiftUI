////
//  Amenity.swift
//  bug-free-goggles
//
//  Created by Mac on 02/06/23.
//

import Foundation

struct Amenity: Identifiable, Hashable{
    let id: String
    let name: String
    let imageName: String
    
    init(name: String, imageName: String){
        self.id = name
        self.name = name
        self.imageName = imageName
    }
}


extension Array where Element == Amenity{
    static var basic: [Amenity] {
        return [
            Amenity(name: "TV", imageName: "tv"),
            Amenity(name: "Free parking on premises", imageName: "freeparking"),
            Amenity(name: "Wifi", imageName: "wifi"),
            Amenity(name: "Dedicated workspace", imageName: "placeholder"),
            Amenity(name: "Air Conditioning", imageName: "airconditioning"),
            Amenity(name: "Washing Machine", imageName: "placeholder")
        ]
    }
    
    static var standout: [Amenity] {
        return [
            Amenity(name: "Exercise equipment", imageName: "placeholder"),
            Amenity(name: "Patio", imageName: "patio"),
            Amenity(name: "BBQ grill", imageName: "bbqgrill"),
            Amenity(name: "Indoor fireplace", imageName: "placeholder"),
            Amenity(name: "Hot tub", imageName: "hottub"),
            Amenity(name: "Patio", imageName: "patio1"),
            Amenity(name: "Fire fit", imageName: "placeholder"),
            Amenity(name: "Pool", imageName: "pool"),
            Amenity(name: "Outdoor shower", imageName: "placeholder")
        ]
    }
}
