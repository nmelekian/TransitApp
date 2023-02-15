//
//  FeedbackEventDetailsView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/6/23.
//

import SwiftUI

struct FeedbackEventDetailsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) var moc
    
    @State private var image: Data = .init(count: 0)
    @State private var showSheet = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading){
                        Text("Tell Us More")
                            .font(.title)
                            .bold()
                        
                        TextEditor(text: $viewModel.currentResponse.details)
                            .scrollContentBackground(.hidden)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(minHeight: 85.0)
                            .focused($isFocused)
                            .accessibilityLabel("Add details textfield")
                    
                        Spacer(minLength: 50)
                    } 
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            
                            Button("Done") {
                                isFocused = false
                            }
                        }
                    }
                    
                    Text("Add A Photo?")
                        .font(.title)
                        .bold()
                    HStack {
                        if image.count != 0 {
                            Image(uiImage: UIImage(data: self.image)!)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                        } else {
                            Image(systemName: "camera")
                        }
                        
                        Spacer()
                        
                        
                        Button {
                            showSheet = true
                        } label: {
                            Text("Choose Photo" )
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                            
                            
                        }.buttonStyle(.borderedProminent)
                        
                    }
                   
                    .sheet(isPresented: $showSheet) {
                        // Pick an image from the photo library:
                        ImagePicker(show: self.$showSheet, image: self.$image)
                        
                    }
                    .padding()
                   
                    
                    Text("Select Date & Time")
                        .font(.title)
                        .bold()
                    DatePicker("Date & Time", selection: $viewModel.currentResponse.date)
                        .datePickerStyle(.graphical)
                    
                    
                }
                .padding()
                
                
                NavigationLink {
                    ShannonFeedbackPersonalDetailsView()
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .onDisappear {
                    viewModel.currentResponse.image = image
                }
                .padding()
            }
            
            
        }
    }
}

struct FeedbackEventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackEventDetailsView()
            .environmentObject(ViewModel())
    }
}
