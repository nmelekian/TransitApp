//
//  ResponseModel.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/26/23.
//

import Foundation

struct Responses: Identifiable, Hashable{
    var id = UUID()
    var category: Category = .lateBus
    var categoryString = ""
    var busRoute = ""
    var busNumber: String = ""
    var complaintType = ""
    var date = Date()
    var details = ""
    var email = ""
    var location = ""
    var name = ""
    var phoneNumber = ""
    var image: Data = .init(count: 0)
}
