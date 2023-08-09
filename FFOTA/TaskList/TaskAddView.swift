//
//  TaskAddView.swift
//  FFOTA
//
//  Created by 이승준 on 2023/08/09.
//

import SwiftUI

struct TaskAddView: View {
    var taskStore: TaskStore
    
    @Binding var isPresentedTaskEditView: Bool
    
    @State var task: String = ""
    @State var selectColor: Color = Color(Theme.red.rawValue)
    
    let colors: [Color] = [
        Color(Theme.red.rawValue),
        Color(Theme.orange.rawValue),
        Color(Theme.yellow.rawValue),
        Color(Theme.green.rawValue),
        Color(Theme.blue.rawValue),
        Color(Theme.navy.rawValue),
        Color(Theme.purple.rawValue),
        Color(Theme.pink.rawValue),
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
                Color(Theme.darkivory.rawValue)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("할 일 수정")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        TextField("할 일을 작성해주세요...", text: $task)
                            .font(.system(size: 24))
                            .foregroundColor(Color(Theme.darkGray.rawValue))
                            .fontWeight(.bold)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    .padding(.vertical, 30)
                    
                    VStack(alignment: .leading) {
                        Text("색상")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
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
            }
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
                        taskStore.addTask()
                    } label: {
                        Text("완료")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct TaskAddView_Previews: PreviewProvider {
    static var previews: some View {
        TaskAddView(taskStore: TaskStore(), isPresentedTaskEditView: .constant(true))
    }
}
