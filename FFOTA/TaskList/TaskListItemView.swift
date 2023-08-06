import SwiftUI

struct TaskListItemView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.87, green: 0.82, blue: 0.72))
                .frame(height: 100)
            HStack {
                Circle()
                    .fill(Color(red: 0.89, green: 0.49, blue: 0.38))
                    .frame(width: 18, height: 18)
                    .padding(.horizontal)
                
                Text("토익시험 준비")
                    .fontWeight(.black)
                    .font(.system(size: 24))
                Spacer()
                Button {
                    
                } label: {
                    Text("수정")
                        .foregroundColor(.gray)
                }
                .padding(.trailing)
            }
            .padding()
        }

    }
}

struct TaskListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListItemView()
    }
}
