//
//  ReviewAndSubmitView.swift
//  TransitApp
//
//  Created by Shannon Lane on 2/15/23.
//

import SwiftUI

struct ReviewAndSubmitView: View {
    
    
    @EnvironmentObject var viewModel: ViewModel
    @FocusState private var busNumberIsFocused: Bool
    @FocusState private var isFocused: Bool
    @FocusState private var emailIsFocused: Bool
    @FocusState private var phoneIsFocused: Bool
    
    
    @StateObject var vm = EmailPracticeViewModel()
    
    
    let busRoutesArray: [String] = ["N/A", "1 Vernor", "2 Michigan", "3 Grand River", "4 Woodward", "5 Van Dyke-Lafayette" , "6 Gratiot", "7 Seven Mile", "8 Warren", "9 Jefferson", "10 Greenfield", "11 Clairmount", "12 Conant", "13 Conner", "15 Chicago-Davison", "16 Dexter", "17 Eight Mile", "18 Fenkell", "19 Fort", "23 Hamilton", "27 Joy", "29 Linwood", "30 Livernois", "31 Mack", "32 McNichols", "38 Plymouth", "39 Puritan", "40 Russell", "41 Schaefer", "42 Mid-City Loop", "43 Schoolcraft", "46 Southfield", "47 Tireman", "52 Chene", "54 Wyoming", "60 Evergreen", "67 Cadillac-Harper", "68 Chalmers"]
    
    let categoriesArray: [String] = ["Late Bus", "No Show", "Bus Stop", "Safety", "Accessibility", "Bus Driver", "Compliment", "Cleanliness", "Other"]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Form {
                    
                    Section {
                        Picker("\(viewModel.currentResponse.categoryString)", selection: $viewModel.currentResponse.categoryString) {
                            ForEach(categoriesArray, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.menu)
                        
                    } header: {
                        Text("Category")
                            .headerProminence(.increased)
                    }
                    
                    
                    Section {
                        TextField("\(viewModel.currentResponse.details)", text: $viewModel.currentResponse.details)
                            .focused($isFocused)
                    } header: {
                        Text("Details")
                            .headerProminence(.increased)
                    }
                    
                    Section {
                        DatePicker("", selection: $viewModel.currentResponse.date)
                            .datePickerStyle(.wheel)
                    } header: {
                        Text("Date & Time")
                            .headerProminence(.increased)
                    }
                    
                    Section {
                        Picker("Pick your bus route", selection: $viewModel.currentResponse.busRoute) {
                            ForEach(busRoutesArray, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Bus Route")
                            .headerProminence(.increased)
                    }
                    
                    Section {
                        
                        TextField("Ex: 1234", text:  $viewModel.currentResponse.busNumber)
                            .focused($isFocused)
                            .keyboardType(.numberPad)
                            .accessibilityLabel("Bus number textfield")
                        
                    } header: {
                        Text("Bus Number")
                            .headerProminence(.increased)
                    }
                    
                    Section {
                        
                        TextField("Name", text:  $viewModel.currentResponse.name)
                            .focused($isFocused)
                        
                    } header: {
                        Text("Name")
                            .headerProminence(.increased)
                    }
                    
                    Section {
                        
                        TextField("Email", text:  $viewModel.currentResponse.email)
                            .focused($isFocused)
                        
                    } header: {
                        Text("Email Address")
                            .headerProminence(.increased)
                    }
                    
                    Section {
                        
                        TextField("Phone Number", text:  $viewModel.currentResponse.phoneNumber)
                            .focused($isFocused)
                            .keyboardType(.numberPad)
                        
                    } header: {
                        Text("Phone Number")
                            .headerProminence(.increased)
                    }
                    
                    
                }
            }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Submit")
                    
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                } .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .simultaneousGesture(TapGesture().onEnded{
                        vm.sendEmailButtonTapped(data:viewModel)
                         viewModel.previousResponses.append(viewModel.currentResponse)
                         viewModel.currentResponse = Responses()
                        
                    })
                
            }.navigationTitle("Review and Submit")
                .padding()
        }
        
    }

struct ReviewAndSubmitView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndSubmitView()
            .environmentObject(ViewModel())
    }
}
