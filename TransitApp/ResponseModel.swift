//
//  ResponseModel.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/26/23.
//

import Foundation

final class Responses: ObservableObject {
    
    @Published var busRoute = ""
    @Published var busNumber: Int16 = 0
    @Published var complaintType = ""
    @Published var date = Date()
    @Published var details = ""
    @Published var email = ""
    @Published var location = ""
    @Published var name = ""
    @Published var phoneNumber = ""
}
