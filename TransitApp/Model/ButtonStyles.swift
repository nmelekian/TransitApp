//
//  ButtonStyles.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/1/23.
//

import Foundation
import SwiftUI

struct ButtonCategoryStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 99, minHeight: 99)
            .background(configuration.isPressed ? Color("CategoryButton") : Color(.gray))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
    }
    
    func colorChange(change: Bool) -> Color {
        var colors: Color
        if change {
            = Color("CategoryButton")
        } else {
            color = Color(.gray)
        }
        
    }
}

protocol Themeable {
    var colorScheme: ColorScheme { get }
}

extension Themeable {
    var buttonColor: Color {
        colorScheme == .dark ? .black : .white
    }
}
