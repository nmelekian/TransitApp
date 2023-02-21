//
//  ViewModel.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @EnvironmentObject var viewModel: ViewModel
    @Published var currentResponse = Responses()
    
    
    // if we do not use fetch request
    @Published var previousResponses: [Responses] = []
}
