//
//  TaskFlow.swift
//  ToDoListCoHo11
//
//  Created by Stephen Truitt on 9/13/26.
//

import SwiftUI

struct TaskRow: View {
    
    var task:TaskModel
    
    var body: some View {
    
        HStack(spacing:12) {
            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isDone ? .green : .secondary)
                .font(.title2)
            
            Text(task.title)
                .font(.body)
                .strikethrough(task.isDone,color: .red)
                .opacity(task.isDone ? 0.3 : 1)
                .animation(.easeInOut(duration: 0.45), value: task.isDone)
            
            Spacer()
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground))
        )
        .onTapGesture {
            withAnimation(.easeinOut(duration: 0.18)) {
                task.isDone.toggle()
            }
        }
    }
}

#Preview {
    TaskRow(task:TaskModel(title: "First", isDone: false))
    TaskRow(task:TaskModel(title: "Second", isDone: true))
}
