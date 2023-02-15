//
//  ContentView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/26/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isShowingSheet: Bool = false
    
    @State private var contentHeight: CGFloat?
    
    
   
    
    @FetchRequest(sortDescriptors: []) var responses: FetchedResults<Response>
    
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                Spacer()
                    .frame(height:150)
                Text("How was your ride?")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .padding()
                
                NavigationLink {
                    CategoryView()
                } label: {
                    Text("+ Share Feedback")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                    
                    
                }
            
                .buttonStyle(.borderedProminent)
                    .padding()
                
                Spacer()
                    .frame(height: 100)
                
               
                    List {
                        Section {
                            ForEach(viewModel.previousResponses) { response in
                                NavigationLink {
                                    VStack(alignment: .leading) {
                                        
                                        Group {
                                            Text("Date: \(response.date.formatted())")
                                            Divider()
                                            Text("Route: \(response.busRoute)")
                                            Divider()
                                            Text("Bus Number: \(response.busNumber)")
                                            Divider()
                                            Text("Location: \(response.location)")
                                            Divider()
                                        }
                                        Group {
                                            Text("Category: \(response.categoryString)")
                                            Divider()
                                            Text("Details: \(response.details)")
                                        }
                                           
                                    
                                        
                                        if response.image.count != 0 {
                                            Image(uiImage: UIImage(data: response.image)!)
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .background(Color.black.opacity(0.2))
                                                .aspectRatio(contentMode: .fill)
                                        } else {
                                            Divider()
                                            Text("No image")
                                        }
                                      
                                    }.navigationTitle("Past Feedback")
                                } label: {
                                    Text("\(response.date)")
                                }
                            }
                            
                        } header: {
                            Text("Past Feedback")
                                .headerProminence(.increased)
                            
                        }
                    }
            }
            .navigationDestination(for: Responses.self) { response in
                        Text("\(response.date)")
               
                    
                    
                    List(viewModel.previousResponses, id: \.self) { response in

                        NavigationLink(value: response) {
                            Text("\(response.date)")
                        }
                    }
                    
                }
            }
        
        }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
