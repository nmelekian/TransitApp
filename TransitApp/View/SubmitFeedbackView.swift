//
//  SubmitFeedbackView.swift
//  TransitApp
//
//  Created by Mallery Heise on 2/9/23.
//

import Foundation
import SwiftUI
import UIKit


class FormViewModel: ObservableObject {
    @State var busRoute = ""
    @State var busNumber = ""
    @State var location = ""
    @State var name = ""
    @State var emailAddress = ""
    @State var details = ""
    @State var photo = ""
    
}

struct SubmitFeedbackView: View {
    
    @StateObject var viewModel = FormViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    Section (header: Text("Bus Route")) {
                        
                        TextField("Bus Route",
                                  text: $viewModel.busRoute)}
                    
                    Section(header: Text("Bus Number")) {
                        TextField("Bus Number",
                                  text: $viewModel.busNumber)}
                    
                    Section(header: Text("Location")) {
                        TextField("Location",
                                  text: $viewModel.location)
                        
                    }
                    
                    Section(header: Text("Name")) {
                        TextField("Name",
                                  text: $viewModel.name)}
                    
                    Section(header: Text("Email Address")) {
                        TextField("Email Address",
                                  text: $viewModel.emailAddress)}
                    
                    Section(header: Text("Details")) {
                        
                        TextField("Details",
                                  text: $viewModel.details)}
                    
                    Section(header: Text("Photo")) {
                        
                        TextField("Photo",
                                  text: $viewModel.photo)
                    }
                }
                
                Button(action: { //some action goes here
                }, label: {
                    Text("Submit")
                        .fontWeight(.bold)
                        .font(.title2)
                        .frame(maxWidth:  .infinity)
                        .foregroundColor(.black)
//                        .background(Color.green)
//                        .foregroundColor(.white)
                        
                    
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
            }
                
                
                    
                
            
            .navigationTitle("Review and Submit")
            
            
                
                
                
                
                
                
                
                
                
                
            }
         
        }
    }
    
    
    struct SubmitFeedbackView_Preview: PreviewProvider {
        static var previews: some View {
            SubmitFeedbackView()
        }
    }
    
