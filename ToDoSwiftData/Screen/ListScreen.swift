//
//  ListScreen.swift
//  ToDoSwiftData
//
//  Created by neodiyadin on 30.11.2024.
//

import SwiftUI
import SwiftData

struct ListScreen: View {
    
    @Query(sort : \ToDo.name, order: .forward) private var toDos : [ToDo]
    @State private var isAddToDoPresented : Bool = false
    
    var body: some View {
        
        NavigationStack {
            ToDoListView(toDos: toDos)
                .toolbar(content : {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("add ToDo") {
                            isAddToDoPresented = true
                        }
                    }
                }).sheet(isPresented: $isAddToDoPresented, content: {
                    NavigationStack {
                        AddToDoScreen()
                    }
                })
        }
    }
}

#Preview {
    ListScreen().modelContainer(for: [ToDo.self])
}
