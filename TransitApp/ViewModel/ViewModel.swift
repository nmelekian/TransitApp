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
                SubmitFeedbackPracticeView()
            case .confirmation:
                ConfirmationView()
            }
        }
    }
    
//    [Responses(categoryString: "Bus", busRoute: "5 & Lafayette", details: "My bus is on fire and won't stop screaming sfsdfsdfsdf sdfsdfsdfsdfdsfsdfdsfsdfdsfsfds", name: "Doug"), Responses(busRoute: "9 Jefferson"), Responses(busRoute: "5 Lafayette"), Responses(busRoute: "5 Lafayette"), Responses(busRoute: "5 Lafayette")]
}
