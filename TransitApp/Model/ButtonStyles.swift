//
//  ButtonStyles.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/1/23.
//

import Foundation
import SwiftUI

struct UnselectedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 99, minHeight: 99)
            .background(.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
    }
    
   
}

struct SelectedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 99, minHeight: 99)
            .background(Color("CategoryButton"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        
        
    }
}


    extension Button {
        @ViewBuilder
        func buttonStyle(change: Bool) -> some View {
            if change {
                buttonStyle(SelectedButtonStyle())
            } else {
                buttonStyle(UnselectedButtonStyle())
            }
        }
    }
