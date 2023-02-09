//
//  CategoryView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/31/23.
//

import SwiftUI

struct CategoryView: View, Themeable {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.managedObjectContext) var moc
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    let columns = [GridItem(.fixed(100)),
                   GridItem(.fixed(100)),
                   GridItem(.fixed(100))]
    
    var body: some View {
       NavigationStack{
            VStack{
                Spacer()
                LazyVGrid(columns: columns) {
                    ForEach(Category.allCases, id: \.self) { category in
                        VStack{
                            Button {
                                viewModel.currentResponse.category = category
                                
                            } label: {
                                    if viewModel.currentResponse.category == category {
                                        Image(systemName: category.imageName)
                                            .padding()
                                            .background {
                                                RoundedRectangle(cornerRadius: 10.0)
                                                    .foregroundColor(buttonColor)
                                            }
                                    } else {
                                        Image(systemName: category.imageName)
                                    }
                                
                            }
                            .buttonStyle(ButtonCategoryStyle())
                        
                            .font(.title)
                            
                            Text(category.rawValue)
                        }

                        
                    }
                }
                Spacer()
                
                NavigationLink {
                    FeedbackEventDetailsView()
                } label: {
                    Text("Next")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Select a Category")
            
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(ViewModel())
    }
}
