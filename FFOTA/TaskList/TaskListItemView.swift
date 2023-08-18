import SwiftUI

struct TaskListItemView: View {
    @Binding var isPresentedTaskEditView: Bool
    var task: Task
    
    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color(Theme.darkivory.rawValue))
//                .frame(height: 100)
            HStack {
                Circle()
                    .fill(task.color)
                    .frame(width: 18, height: 18)
                    .padding(.horizontal)
                
                Text("\(task.title)")
                    .foregroundColor(Color(Theme.darkGray.rawValue))
                    .fontWeight(.black)
                    .font(.system(size: 24))
                Spacer()
//                Button {
//                    isPresentedTaskEditView = true
//                } label: {
//                    Text("수정")
//                        .foregroundColor(.gray)
//                }
//                .padding(.trailing)
            }
            .padding()
//        }

    }
}

struct TaskListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListItemView(isPresentedTaskEditView: .constant(true), task: Task(title: "", colorName: Theme.darkivory.rawValue))
    }
}
