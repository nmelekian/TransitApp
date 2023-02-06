//
//  FeedbackPersonalDetailsView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import SwiftUI

struct FeedbackPersonalDetailsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FeedbackPersonalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackPersonalDetailsView()
            .environmentObject(ViewModel())
    }
}
