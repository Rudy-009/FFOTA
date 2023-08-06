import SwiftUI

struct TaskListView: View {
    @State var isPresentedTaskEditView: Bool = false
    
    var body: some View {
        ZStack {
            Color(Theme.ivory.rawValue)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
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
                        ForEach(0..<6) { index in
                            TaskListItemView(isPresentedTaskEditView: $isPresentedTaskEditView)
                                .padding()
                        }
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentedTaskEditView) {
            TaskEditView(isPresentedTaskEditView: $isPresentedTaskEditView)
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
