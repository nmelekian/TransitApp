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
                /*header: {
                    Text("Bus Number")
                        .headerProminence(.increased)
                }*/
                    
                    Section (header: Text("Bus Route")
                        .headerProminence(
                            .increased)) {
                        
                        TextField("Bus Route",
                                  text: $viewModel.busRoute)}
                    
                    Section(header: Text("Bus Number")
                        .headerProminence(
                            .increased)) {
                                
                        TextField("Bus Number",
                                  text: $viewModel.busNumber)}
                    
                    Section(header: Text("Location")
                        .headerProminence(
                            .increased)) {
                                
                        TextField("Location",
                                  text: $viewModel.location)
                        
                    }
                    
                    Section(header: Text("Name")
                        .headerProminence(
                            .increased)) {
                                
                        TextField("Name",
                                  text: $viewModel.name)}
                    
                    Section(header: Text("Email Address").headerProminence(.increased)) {
                        
                        TextField("Email Address",
                                  text: $viewModel.emailAddress)}
                    
                    Section(header: Text("Details").headerProminence(
                        .increased)) {
                        
                        TextField("Details",
                                  text: $viewModel.details)}
                    
                    Section(header: Text("Photo").headerProminence(.increased))
                    {
                        
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
    
