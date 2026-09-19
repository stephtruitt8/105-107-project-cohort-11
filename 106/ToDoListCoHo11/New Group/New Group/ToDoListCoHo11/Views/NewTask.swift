//
//  NewTask.swift
//  ToDoListCoHo11
//
//  Created by Stephen Truitt on 9/14/26.
//

import SwiftUI

struct NewTask: View {
    @State private var titlte: String = ""
    @State var isCompleted: Bool = false
    
    var name: String
    var onDelete: () -> Void
    var onAdd: (TaskModel) -> Void
    

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing:16) {
            
            TextField("Task title", text: $title)
                .textFieldStyle(.roundedBorder)
            
            
            Button("Add") {
                task.append(task(title: task, isCompleted: isCompleted))
                dismiss()
            }
            
            Button("Cancel") {
                dismiss()
            }
        }
    }
}

#Preview {
    @State var sampleTasks: [Task] = []
    NewTask(tasks: $sampleTasks)
}
