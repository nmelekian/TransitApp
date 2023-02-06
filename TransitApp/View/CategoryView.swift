//
//  CategoryView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/31/23.
//

import SwiftUI

struct CategoryView: View {
    @State private var icons = ["bus","figure.wave","sailboat.fill", "fuelpump"]
    
    @State private var labels = ["Bus", "waving man", "sailboat", "fuel pump"]
    
    let columns = [GridItem(.fixed(100)),
                   GridItem(.fixed(100)),
                   GridItem(.fixed(100))]
    
    var body: some View {
        VStack {
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(0..<icons.count) { i in
                    VStack{
                        Button {
                            print("hi")
                        } label: {
                            Image(systemName: icons[i])
                        }
                        .buttonStyle(ButtonCategoryStyle())
                        .font(.title)
                        Text(labels[i])
                            .font(.headline)
                    }

                    
                }
            }
            Spacer()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
