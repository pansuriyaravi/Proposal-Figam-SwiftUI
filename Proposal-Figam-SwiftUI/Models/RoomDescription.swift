////
//  RoomDescription.swift
//  bug-free-goggles
//
//  Created by Mac on 02/06/23.
//

import Foundation

struct RoomDescription: Identifiable, Hashable{
    let id: String
    let name: String
    let imageName: String
    
    init(name: String, imageName: String){
        self.id = name
        self.name = name
        self.imageName = imageName
    }
}

extension Array where Element == RoomDescription{
    static var basic: [RoomDescription] {
        return [
            RoomDescription(name: "Apartment", imageName: "apartment"),
            RoomDescription(name: "Hotel", imageName: "hotel"),
            RoomDescription(name: "Flat", imageName: "sharedroom"),
            RoomDescription(name: "Single room", imageName: "singleroom"),
            RoomDescription(name: "Shared room", imageName: "sharedroom"),
        ]
    }
    
    static var house: [RoomDescription] {
        return [
            RoomDescription(name: "House", imageName: "home_work")
        ]
    }
}
