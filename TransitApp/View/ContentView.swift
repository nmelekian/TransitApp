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
    
    @FetchRequest(sortDescriptors: []) var responses: FetchedResults<Response>
    
    var body: some View {
        VStack {
            
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
