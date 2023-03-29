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
    
    @Published var path = NavigationPath()
    // if we do not use fetch request
    @Published var previousResponses: [Responses] = []
    
    
    func returnHome(){
        self.path.removeLast(self.path.count)
    }
    
    // Options for the main navigation links
    enum Route {
        case category
        case eventDetails
        case personalDetails
        case submit
        case confirmation
        @ViewBuilder
        var view: some View {
            switch self {
            case .category:
                CategoryView()
            case .eventDetails:
                FeedbackEventDetailsView()
            case .personalDetails:
                ShannonFeedbackPersonalDetailsView()
            case .submit:
                ReviewAndSubmitView()
            case .confirmation:
                ConfirmationView()
            }
        }
    }
}
