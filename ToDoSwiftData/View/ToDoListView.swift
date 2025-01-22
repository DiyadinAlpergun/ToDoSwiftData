//
//  ToDoListView.swift
//  ToDoSwiftData
//
//  Created by neodiyadin on 30.11.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    let toDos : [ToDo]
    @Environment(\.modelContext) private var context
    
    
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                    }
                }
                
            }.onDelete(perform: { IndexSet in
                IndexSet.forEach { index in
                    let toDo = self.toDos[index]
                    context.delete(toDo)
                    
                    do {
                        try context.save()
                    } catch {
                        print("Error saving context: \(error)")
                    }
                }
            })
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailScreen(toDo: toDo)
        }
    }
}

#Preview {
    ToDoListView( toDos: [ToDo(name: "test", priority: 123)]).modelContainer(for: [ToDo.self])
}
