import SwiftUI

struct TaskListView: View {
    @StateObject var taskStore: TaskStore = TaskStore()
    
    @State var isPresentedTaskEditView: Bool = false
    @State var isPresentedTaskAddView: Bool = false
    
    @State var currentTask: Task = Task(title: "제발!", colorName: Theme.ivory.rawValue)
    
    @Binding var index: Int
    
    var body: some View {
        ZStack {
            Color(Theme.ivory.rawValue)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button { //Add Button
                        isPresentedTaskAddView = true
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color(Theme.darkivory.rawValue))
                                .frame(width: 30, height: 30)
                            Image(systemName: "plus")
                                .foregroundColor(Color(Theme.darkGray.rawValue))
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                        }
                    }
                    .padding([.trailing, .bottom, .top])
                }
                
                ScrollView {
                    VStack {
                        ForEach(taskStore.tasks) { task in
                            Button {
                                //MainView로 넘어가야 함
                                withAnimation{
                                    index = 1
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(Theme.darkivory.rawValue))
                                        .frame(height: 100)
                                    
                                    HStack {
                                        TaskListItemView(isPresentedTaskEditView: $isPresentedTaskEditView, task: task)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.currentTask = task
                                            isPresentedTaskEditView = true
                                        } label: {
                                            Text("수정")
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.trailing)
                                    }
                                }
                                .contextMenu {
                                    Button {
                                        taskStore.deleteTask(task: task)
                                    } label: {
                                        Image(systemName: "trash.slash")
                                        Text("Remove")
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentedTaskAddView) {
            TaskAddView(taskStore: taskStore, isPresentedTaskAddView: $isPresentedTaskAddView)
        }
        .sheet(isPresented: $isPresentedTaskEditView) {
            TaskEditView(taskStore: taskStore, task: $currentTask, isPresentedTaskEditView: $isPresentedTaskEditView)
        }
        .onAppear{
            taskStore.fetchTasks()
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(index: .constant(2))
    }
}

struct ExampleData: Identifiable {
    let id = UUID()
    var name: String
}
