//
//  FeedbackEventDetailsView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import SwiftUI

struct FeedbackEventDetailsView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Details")
            TextEditor(text: $viewModel.currentResponse.details)
                .scrollContentBackground(.hidden)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("Hi")
        }
        .padding()
    }
}

struct FeedbackEventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackEventDetailsView()
            .environmentObject(ViewModel())
    }
}
