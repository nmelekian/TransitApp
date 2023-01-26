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
    
  
    @StateObject var userResponse = Responses()
    
    @State private var complaints = ["Bus shelter", "Bus cleanliness", "Bus safety", "late/missing bus"]
    @FetchRequest(sortDescriptors: []) var responses: FetchedResults<Response>
    
    var body: some View {
        
        VStack {
            List{
                    TextField("Bus Routes", text: $userResponse.busRoute)
                    Picker("Bus Number", selection: $userResponse.busNumber) {
                        ForEach(1..<101) {
                            Text(String($0))
                        }
                    }
                    Picker("Complaint type", selection: $userResponse.complaintType) {
                            ForEach(complaints, id: \.self) {
                                Text($0)
                            }
                        }
                    TextField("Name", text: $userResponse.name)
                
            }
            
            Button("Save") {
                
            }
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
