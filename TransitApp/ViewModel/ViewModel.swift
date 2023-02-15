//
//  ViewModel.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var currentResponse = Responses()
    
    
    // if we do not use fetch request
    @Published var previousResponses: [Responses] = []
    
    @Published var path = NavigationPath()
    
//    [Responses(categoryString: "Bus", busRoute: "5 & Lafayette", details: "My bus is on fire and won't stop screaming sfsdfsdfsdf sdfsdfsdfsdfdsfsdfdsfsdfdsfsfds", name: "Doug"), Responses(busRoute: "9 Jefferson"), Responses(busRoute: "5 Lafayette"), Responses(busRoute: "5 Lafayette"), Responses(busRoute: "5 Lafayette")]
}
