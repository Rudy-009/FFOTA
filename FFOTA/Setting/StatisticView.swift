import SwiftUI

struct StatisticView: View {
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
                    StatisticBoxView()
                    StatisticBoxView()
                    StatisticBoxView()
                    StatisticBoxView()
                    StatisticBoxView()
                    StatisticBoxView()
                    StatisticBoxView()
                }
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
