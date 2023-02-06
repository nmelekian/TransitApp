//
//  ResponseModel.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/26/23.
//

import Foundation

struct Responses: Identifiable {
    var id = UUID()
    var category: Category = .bus
    var busRoute = ""
    var busNumber: Int16 = 0
    var complaintType = ""
    var date = Date()
    var details = ""
    var email = ""
    var location = ""
    var name = ""
    var phoneNumber = ""
}
