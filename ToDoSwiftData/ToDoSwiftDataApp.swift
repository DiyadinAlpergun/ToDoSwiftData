//
//  ToDoSwiftDataApp.swift
//  ToDoSwiftData
//
//  Created by neodiyadin on 30.11.2024.
//

import SwiftUI

@main
struct ToDoSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListScreen()
            }
        }.modelContainer(for: [ToDo.self])
    }
}
