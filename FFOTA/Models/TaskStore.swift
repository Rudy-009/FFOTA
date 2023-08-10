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
    
    func editTask() {
        
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
