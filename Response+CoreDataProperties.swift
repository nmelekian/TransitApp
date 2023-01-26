//
//  Response+CoreDataProperties.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/26/23.
//
//

import Foundation
import CoreData


extension Response {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Response> {
        return NSFetchRequest<Response>(entityName: "Response")
    }

    @NSManaged public var busNumber: Int16
    @NSManaged public var busRoute: String?
    @NSManaged public var complaintType: Int16
    @NSManaged public var date: Date?
    @NSManaged public var details: String?
    @NSManaged public var email: String?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    

}

extension Response : Identifiable {

}
