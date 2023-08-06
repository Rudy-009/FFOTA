import SwiftUI

struct TaskEditView: View {
    @State var isPresentedTaskEditView: Bool = false
    
    @State var task: String = ""
    @State var selectColor: Color = Color(red: 0.89, green: 0.49, blue: 0.38)
    
    let colors: [Color] = [
        Color(red: 0.89, green: 0.49, blue: 0.38),
        Color(red: 0.9, green: 0.57, blue: 0.37),
        Color(red: 0.89, green: 0.78, blue: 0.5),
        Color(red: 0.79, green: 0.82, blue: 0.51),
        Color(red: 0.61, green: 0.8, blue: 0.82),
        Color(red: 0.47, green: 0.6, blue: 0.73),
        Color(red: 0.78, green: 0.7, blue: 0.85),
        Color(red: 0.9, green: 0.66, blue: 0.63)
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.87, green: 0.82, blue: 0.72)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("할 일 수정")
                            .fontWeight(.bold)
                        TextField("할 일을 작성해주세요...", text: $task)
                            .padding()
                            .border(Color.gray)
                            .foregroundColor(Color(red: 0.37, green: 0.36, blue: 0.36))
                    }
                    .padding(.vertical, 30)
                    
                    VStack(alignment: .leading) {
                        Text("색상")
                            .fontWeight(.bold)
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(colors, id: \.self) { color in
                                Button {
                                    selectColor = color
                                } label: {
                                    ZStack {
                                        Circle()
                                            .fill(color)
                                            .frame(width: 53, height: 53)
                                        
                                        if selectColor == color {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isPresentedTaskEditView = false
                        } label: {
                            Text("취소")
                                .foregroundColor(.primary)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isPresentedTaskEditView = false
                        } label: {
                            Text("완료")
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            
        }
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView()
    }
}
