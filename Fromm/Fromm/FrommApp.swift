//
//  FrommApp.swift
//  Fromm
//
//  Created by Junhong Park on 2022/01/24.
//

import SwiftUI

@main
struct FrommApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
