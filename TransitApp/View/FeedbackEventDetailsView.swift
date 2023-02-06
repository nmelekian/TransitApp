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
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Tell Us More")
                        .font(.title)
                        .fontWeight(.bold)
                    TextEditor(text: $viewModel.currentResponse.details)
                        .scrollContentBackground(.hidden)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer(minLength: 50)
                }
                
                Text("Add A Photo?")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    if image.count != 0 {
                        Image(uiImage: UIImage(data: self.image)!)
                            .resizable()
                        //                              .cornerRadius(50)
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
                         .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
//                         .cornerRadius(16)
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
                        

                                //  If you wish to take a photo from camera instead:
                        }
                
                
                Spacer(minLength: 200)
                
            }
            .padding()
            NavigationLink
//            NavigationLink {
//                FeedbackPersonalDetailsView()
//            } label: {
//                Text("Next")
//            }
            .buttonStyle(.borderedProminent)
            
            
        }
    }
}

struct FeedbackEventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackEventDetailsView()
            .environmentObject(ViewModel())
    }
}
