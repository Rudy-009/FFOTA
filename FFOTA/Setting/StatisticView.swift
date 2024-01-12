import SwiftUI

struct StatisticView: View {
    @ObservedObject var timeTokenStore: TimeTokenStore = TimeTokenStore()
    var body: some View {
        ZStack {
            Color("\(Theme.ivory)")
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Text("7월 첫째주")
                        .fontWeight(.semibold)
                    Spacer()
                }
                HStack {
                    ForEach(timeTokenStore.timeStackofaWeek, id: \.self) { timeStack in
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 40, height: 40)
                            .foregroundColor(timeStack)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1)
                            )
                    }
                }
            }
            .onAppear {
                timeTokenStore.loadAndUpdateTodayTimeStack()
            }
            .padding()
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
