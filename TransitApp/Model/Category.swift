//
//  Category.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import Foundation

enum Category: String, CaseIterable {
    case lateBus = "Late Bus"
    case noShow = "No Show"
    case busStop = "Bus Stop"
    case safety = "Safety"
    case accessibility = "Accessibility"
    case busDriver = "Bus Driver"
    case compliments = "Compliment"
    case cleanliness = "Cleanliness"
    case other = "Other"
    
    
    var imageName: String {
        switch self {
        case .lateBus:
            return "bus"
        case .noShow:
            return "figure.wave"
        case .busStop:
            return "sailboat.fill"
        case .safety:
            return "bus"
        case .accessibility:
            return "bus"
        case .busDriver:
            return "bus"
        case .compliments:
            return "bus"
        case .cleanliness:
            return "bus"
        case .other:
            return "bus"
        
        }
    }
    
    
//    var categoryChoice: [String] {
//        switch self {
//        case .bus:
//            return ["bus", "bus"]
//        case .shelter:
//            return ["bus", "bus"]
//        case .crime:
//            return ["bus", "bus"]
//            
//        }
//        
//    }
    
}
