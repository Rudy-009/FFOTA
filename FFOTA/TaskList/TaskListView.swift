import SwiftUI

struct TaskListView: View {
    @State var isPresentedTaskEditView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 234/255, green: 220/255, blue: 195/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ForEach(0..<5) { index in
                        TaskListItemView()
                            .padding()
                    }
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color(red: 127/255, green: 127/255, blue: 127/255, opacity: 0.2))
                                .frame(width: 30, height: 30)
                            Image(systemName: "plus")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isPresentedTaskEditView) {
            //            TaskEditView()
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
