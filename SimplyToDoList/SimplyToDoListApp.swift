//
//  SimplyToDoListApp.swift
//  SimplyToDoList
//
//  Created by Serhii Berehovyi on 06.12.22.
//

import SwiftUI

@main
struct SimplyToDoListApp: App {
    @StateObject var toDosVM = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
