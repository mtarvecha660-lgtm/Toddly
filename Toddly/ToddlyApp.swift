//
//  ToddlyApp.swift
//  Toddly
//
//  Created by student on 04/12/25.
//

import SwiftUI
import SwiftData

@main
struct ToddlyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Listt.self)
        }
    }
}
