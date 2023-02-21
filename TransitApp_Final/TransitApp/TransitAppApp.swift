//
//  TransitAppApp.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 1/26/23.
//

import SwiftUI

@main
struct TransitAppApp: App {
    @StateObject private var dataController = DataController()
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
          ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(viewModel)
        }
    }
}
