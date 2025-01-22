//
//  ContentView.swift
//  ToDoSwiftData
//
//  Created by neodiyadin on 30.11.2024.
//

import SwiftUI
import SwiftData

struct AddToDoScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var priority: Int?
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("name", text: $name)
                TextField("priority", value: $priority, format: .number)
            }
            .navigationTitle("add todo")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button (action: {
                        dismiss()
                    }, label: {
                        Text("Dismiss")
                    })
                    
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button (action: {
                        //Save action
                        guard let priority = priority else { return }
                        let todo = ToDo(name: name, priority: priority)
                        context.insert(todo)
                       
                       do {
                            try context.save()
                        } catch {
                            print(error)
                        }
                        
                        dismiss()
                        
                        
                        
                    }, label: {
                        Text("Save")
                    }).disabled(!isFormValid)
                    
                }
            }
        }
    }
}

#Preview {
    AddToDoScreen().modelContainer(for: [ToDo.self])
}
