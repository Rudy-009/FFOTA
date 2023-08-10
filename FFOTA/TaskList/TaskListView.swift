import SwiftUI

struct TaskListView: View {
    @StateObject var taskStore: TaskStore = TaskStore()
    
    @State var isPresentedTaskEditView: Bool = false
    @State var isPresentedTaskAddView: Bool = false
    
    @State var currentTask: Task = Task(title: "제발!", color: .yellow)
    
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
                    .padding([.trailing, .bottom])
                }
                
                ScrollView {
                    VStack {
                        ForEach(taskStore.tasks) { task in
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
            TaskEditView(taskStore: taskStore, task: currentTask, isPresentedTaskEditView: $isPresentedTaskEditView)
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct ExampleData: Identifiable {
    let id = UUID()
    var name: String
}
