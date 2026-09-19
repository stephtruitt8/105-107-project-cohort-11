//
//  TaskModel.swift
//  ToDoListCoHo11
//
//  Created by Stephen Truitt on 9/13/26.
//

import Foundation

struct TaskModel:Identifiable{
    let id:UUID = UUID()
    let title:String
    var isDone:Bool = false
}
