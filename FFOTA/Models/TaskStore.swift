//
//  TaskStore.swift
//  FFOTA
//
//  Created by yunjikim on 2023/08/09.
//

import Foundation
import SwiftUI

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(_ name: String, _ color: Color) {
        tasks.append(Task(title: name,color: color))
    }
    
    func editTask(title: String, color: Color, task: Task) {
        var index: Int = 0
        
        for temp in tasks {
            if temp.id == task.id {
                tasks.remove(at: index)
                tasks.insert(Task(title: title, color: color), at: index)
                break
            }
            index += 1
        }
    }
    
    func deleteTask( task targeTask: Task) {
        
        for index in 0..<tasks.count {
            if targeTask.id == tasks[index].id {
                tasks.remove(at: index)
                return
            }
        }
    }
}
