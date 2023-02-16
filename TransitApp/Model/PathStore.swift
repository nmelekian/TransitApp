//
//  PathStore.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/16/23.
//

import Foundation
import SwiftUI

class PathStore: ObservableObject {
    @Published var path = NavigationPath()
    {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")

//    init() {
//        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
//                path = NavigationPath(decoded)
//                return
//            }
//        }
//    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
