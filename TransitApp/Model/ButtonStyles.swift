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
            .background(Color("CategoryButton"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(minWidth: 99, minHeight: 99)
            
    }
}
