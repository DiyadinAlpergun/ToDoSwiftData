//
//  ToDo.swift
//  ToDoSwiftData
//
//  Created by neodiyadin on 30.11.2024.
//

import Foundation
import SwiftData

@Model
final class ToDo {
    var name: String
    var priority: Int
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
