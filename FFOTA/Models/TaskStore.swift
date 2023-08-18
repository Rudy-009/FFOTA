import Foundation
import SwiftUI

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []
    
    func fetchTasks() {
        do {
            if let data = UserDefaults.standard.object(forKey: "Counts") as? Data {
                let decoder: JSONDecoder = JSONDecoder()
                
                tasks = try decoder.decode([Task].self, from: data)
            }
        } catch {
            print("UserDefaults로 부터 데이터 가져오기 실패")
        }
    }
    
    func saveTasks() {
        do {
            let endcoder: JSONEncoder = JSONEncoder()
            let data: Data = try endcoder.encode(tasks)
            UserDefaults.standard.set(data, forKey: "Counts")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
    }
    
    func addTask(_ name: String, _ color: String) {
        tasks.append(Task(title: name, colorName: color))
        saveTasks()
    }
    
    func editTask(title: String, color: String, task: Task) {
        var index: Int = 0
        
        for temp in tasks {
            if temp.id == task.id {
                tasks.remove(at: index)
                tasks.insert(Task(title: title, colorName: color), at: index)
                saveTasks()
                break
            }
            index += 1
        }
    }
    
    func deleteTask( task targeTask: Task) {
        
        for index in 0..<tasks.count {
            if targeTask.id == tasks[index].id {
                tasks.remove(at: index)
                saveTasks()
                return
            }
        }
    }
}
