//
//  Progress.swift
//  ToDoListCoHo11
//
//  Created by Stephen Truitt on 9/13/26.
//

import SwiftUI

struct ProgressHeader: View {
    
    let tasks:[TaskModel]
    
    var doneCount:Int {
        
        tasks.filter{$0.isDone}.count
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            HStack{
                Text("My Task").font(.title).bold()
                Spacer()
                Text("\(doneCount) / \(tasks.count)")
            }
            
            HStack{
            }
            
            ProgressView(
                value:Double(doneCount),
                total: Double(tasks.count)
            )
            .tint(.green)
            .animation(.easeInOut, value: doneCount)
        }
        .padding()
        
    }
}

#Preview {
    ProgressHeader(tasks: []
    )
}

