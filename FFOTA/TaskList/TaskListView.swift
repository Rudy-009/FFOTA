import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskStore: TaskStore = TaskStore()
    
    @State var isPresentedTaskEditView: Bool = false
    @State var isPresentedTaskAddView: Bool = false
    
    var body: some View {
        ZStack {
            Color(Theme.ivory.rawValue)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button { //Add Button
                        isPresentedTaskEditView = true
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
                            TaskListItemView(isPresentedTaskEditView: $isPresentedTaskEditView, task: task)
                                .padding()
                        }
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentedTaskEditView) {
            TaskAddView(taskStore: taskStore, isPresentedTaskAddView: $isPresentedTaskAddView)
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
