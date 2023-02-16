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
            return "lateBus"
            //"clock.badge.exclamationmark.fill"
        case .noShow:
            return "noShow"
                //"figure.wave"
        case .busStop:
            return "busStop"
            //signpost.left.fill
        case .safety:
            return "safetyTriangle"
            //"exclamationmark.triangle.fill"
        case .accessibility:
            return "accessibility"
            //"figure.roll"
        case .busDriver:
            return "driver"
        case .compliments:
            return "compliments"
            //"trophy.fill"
        case .cleanliness:
            return "cleanliness"
        case .other:
            return "other"
            //"ellipsis"
        
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
