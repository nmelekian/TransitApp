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
        VStack{
            Text(viewModel.currentResponse.details)
            Text(viewModel.currentResponse.complaintType)
            if viewModel.currentResponse.image.count != 0 {
                Image(uiImage: UIImage(data: viewModel.currentResponse.image)!)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "camera")
            }
        }
        .padding()
    }
}

struct FeedbackPersonalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackPersonalDetailsView()
            .environmentObject(ViewModel())
    }
}
