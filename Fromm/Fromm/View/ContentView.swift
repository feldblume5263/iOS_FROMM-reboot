//
//  ContentView.swift
//  Fromm
//
//  Created by Junhong Park on 2022/01/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    
    var body: some View {
        NavigationView {
            LibraryView()
        }
    }
}

