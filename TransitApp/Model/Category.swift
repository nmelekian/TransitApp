//
//  Category.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import Foundation

enum Category: String, CaseIterable {
    case bus = "Bus"
    case shelter = "Shelter"
    case crime = "Crime"
    
    var imageName: String {
        switch self {
        case .bus:
            return "bus"
        case .shelter:
            return "figure.wave"
        case .crime:
            return "sailboat.fill"
        }
    }
    
    
}


