//
//  FeedbackPersonalDetailsView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import SwiftUI
import UIKit

struct FeedbackPersonalDetailsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack(alignment: .leading) {
        
            
            TextField(
                "Name",
                text: $viewModel.currentResponse.name
            )
            .disableAutocorrection(true)
            
            Text("Email")
            Text("Phone number")
            }
        }

      //  }
    }


struct FeedbackPersonalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackPersonalDetailsView()
            .environmentObject(ViewModel())
    }
}
