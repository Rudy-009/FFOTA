import SwiftUI

struct MainView: View {
    @Binding var index: Int
    
    var body: some View {
        VStack{
            //할 일 이름
            Button {
                index = 2
            } label: {
                Text("토익 문제 풀기")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(Theme.cherry.rawValue))
            }.padding(.top, 50)
            //타이머
            ZStack{
                TimerCIrcle()
            }
            .padding(.leading, 40)
            .padding(.trailing, 40)
            
            //Start버튼
            Button {
                //타이머 시작 버튼
            } label: {
                Text("START")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(Theme.cherry.rawValue))
            }
            .padding(.bottom, 100)
            
        }
        .background(Color(Theme.ivory.rawValue))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(index: .constant(1))
    }
}
