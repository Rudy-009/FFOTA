//
//  TaskAddView.swift
//  FFOTA
//
//  Created by 이승준 on 2023/08/09.
//

import SwiftUI

struct TaskAddView: View {
    var taskStore: TaskStore
    
    @Binding var isPresentedTaskAddView: Bool
    
    @State var task: String = ""
    @State var selectColor = Theme.red.rawValue
    
    let colors: [String] = [
        Theme.red.rawValue,
        Theme.orange.rawValue,
        Theme.yellow.rawValue,
        Theme.green.rawValue,
        Theme.blue.rawValue,
        Theme.navy.rawValue,
        Theme.purple.rawValue,
        Theme.pink.rawValue,
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
                        Text("할 일")
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
                                            .fill(Color(color))
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
                        isPresentedTaskAddView = false
                    } label: {
                        Text("취소")
                            .foregroundColor(.primary)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedTaskAddView = false
                        taskStore.addTask(task, selectColor)
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
        TaskAddView(taskStore: TaskStore(), isPresentedTaskAddView: .constant(true))
    }
}
