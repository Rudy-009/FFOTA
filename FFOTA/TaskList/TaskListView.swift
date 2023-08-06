import SwiftUI

struct TaskListView: View {
    @State var isPresentedTaskEditView: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 234/255, green: 220/255, blue: 195/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        isPresentedTaskEditView = true
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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresentedTaskEditView = true
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
