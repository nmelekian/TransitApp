//
//  ViewModel.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var currentResponse = Responses()
    
    
    // if we do not use fetch request
    @Published var previousResponses: [Responses] = []
}
