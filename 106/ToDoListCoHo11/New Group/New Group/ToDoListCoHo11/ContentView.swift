//
//  ContentView.swift
//  ToDoListCoHo11
//
//  Created by Stephen Truitt on 9/13/26.
//

import SwiftUI


struct ContentView: View {
    
    @State var tasks:[TaskModel] = [
        TaskModel(title: "Task 1",isDone: true),
        TaskModel(title: "Task 2",isDone: true),
        TaskModel(title: "Task 3",isDone: false),
        TaskModel(title: "Task 4",isDone: true),
        TaskModel(title: "Task 5",isDone: true),
        TaskModel(title: "Task 6",isDone: false)
    ]
    
    @State private var showingAddTask = false
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing:12) {
                
                ProgressHeader(tasks: tasks)
                
                Button("Add a new task"){
                    showingAddTask.toggle()
                }
                
                LazyVStack(spacing:12){
                    
                    ForEach($tasks){ task in
                        
                        TaskRow(task: $task)
                            .transition(
                                .move(edge: .top)
                                .combined(with: .opacity)
                            )
                        
                    }.padding(.horizontal)
                    
                    
                }
                
                
            }
            
        }.sheet(isPresented: $showingAddTask) {
            AddTaskView(
                onAdd: { newTask in
                    
                    tasks.append(newTask)
                }
            )
        }
        
    }
}

#Preview {
    ContentView()
}
