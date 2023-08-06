import SwiftUI

struct StatisticBoxView: View {
    // TODO: 누적 시간에 따른 색상으로 바꾸기
    var boxColor: Color = Color.white
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: 40, height: 40)
            .foregroundColor(boxColor)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1)
            )
    }
}

struct StatisticBoxView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticBoxView()
    }
}
