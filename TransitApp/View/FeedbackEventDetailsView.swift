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
  
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading){
                        Text("Tell Us More")
                            .font(.title)
                            .fontWeight(.bold)
                        TextEditor(text: $viewModel.currentResponse.details)
                            .scrollContentBackground(.hidden)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(minHeight: 85.0)
                        Spacer(minLength: 50)
                    }
                    
                    Text("Add A Photo?")
                        .font(.title)
                        .fontWeight(.bold)
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

                         Text("Choose Photo")
                             .font(.headline)
                             .frame(maxWidth: .infinity)
                             .frame(height: 50)
                             .background(.blue)
                             .foregroundColor(.white)
                                 .padding(.horizontal, 20)
                                 .onTapGesture {
                                   showSheet = true
                                 }
                            }
                        .padding(.horizontal, 20)
                        .sheet(isPresented: $showSheet) {
                                    // Pick an image from the photo library:
                            ImagePicker(show: self.$showSheet, image: self.$image)
                            
                            }
                  
                    Text("Select Date & Time")
                        .font(.title)
                    DatePicker("Date & Time", selection: $viewModel.currentResponse.date)
                        .datePickerStyle(.graphical)

                    
                }
                .padding()
            }
            NavigationLink {
                FeedbackPersonalDetailsView()
            } label: {
                Text("Next")
            }
            .buttonStyle(.borderedProminent)
            .onDisappear {
                viewModel.currentResponse.image = image
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
