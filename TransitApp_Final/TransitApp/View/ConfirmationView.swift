//
//  ConfirmationView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/22/23.
//

import SwiftUI

struct ConfirmationView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            Text("Feedback Received,")
                .font(.title2)
                .bold()
            Text("Thank You!")
                .font(.title2)
                .bold()
            LottieView(lottieFile: "bus", animationSpeed: 2)
                .frame(width: 300, height: 300)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                viewModel.returnHome()
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
        .navigationBarBackButtonHidden(true)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
            .environmentObject(ViewModel())
    }
}

