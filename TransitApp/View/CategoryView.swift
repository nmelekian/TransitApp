//
//  CategoryView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/31/23.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) var moc
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    
    let columns = [GridItem(.fixed(100)),
                   GridItem(.fixed(100)),
                   GridItem(.fixed(100))]
    
    var body: some View {
//       NavigationStack{
           ScrollView {
               VStack{
                   Text("Please choose the category that best fits your feedback.")
                       .font(.system(.body, design: .rounded))
                   
                   LazyVGrid(columns: columns) {
                       ForEach(Category.allCases, id: \.self) { category in
                           VStack{
                               Button {
                                   viewModel.currentResponse.category = category
                                   
                               } label: {
                                   
                                   Image(systemName: category.imageName)
                                   
                               }
                               .buttonStyle(change: (viewModel.currentResponse.category == category))
                               
                               .font(.title)
                               
                               Text(category.rawValue)
                                   .padding(.bottom)
                                   
                           } .accessibilityElement(children: .combine)
                           
                           
                       }
                   }
                   Spacer(minLength: 50)
                   
                   NavigationLink {
                       FeedbackEventDetailsView()
                   } label: {
                       Text("Next")
                           .frame(maxWidth: .infinity)
                           .foregroundColor(.black)
                           .font(.title2)
                           .bold()
                   }
                   .buttonStyle(.borderedProminent)
                   .controlSize(.large)
               }
               .navigationTitle("Select a Category")
               .padding()
           }
           
//       } // end of nav
       .padding()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(ViewModel())
    }
}
