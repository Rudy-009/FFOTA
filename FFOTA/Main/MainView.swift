import SwiftUI

struct MainView: View {
    @Binding var index: Int
    @State var timerProgress: Double = 0
    @State var timer: Timer?
    @State var isTimerRunning = false
    
    var displayMinutes: Int {
        Int(timerProgress * 1 / 6)
    }
    
    var displaySeconds: Int {
        Int(timerProgress.truncatingRemainder(dividingBy: 1 / 6))
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: 80)
            Text("토익 문제 풀기")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(Theme.cherry.rawValue))
            
            TimerCircle(timerProgress: $timerProgress)
            
            Button {
                isTimerRunning.toggle()
                if isTimerRunning {
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { time in
                        timerProgress > 0 ? timerProgress -= 1 / 3600 : timer?.invalidate()
                    }
                } else {
                    timer?.invalidate()
                }
            } label: {
                Text("\(timerProgress == 0 ? "START" : "\(displayMinutes) : \(displaySeconds)")")
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
