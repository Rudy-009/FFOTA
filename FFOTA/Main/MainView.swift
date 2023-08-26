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
        Int(timerProgress.truncatingRemainder(dividingBy: 6) * 10)
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
            Text("\(timerProgress)")
            Button {
                isTimerRunning.toggle()
                if isTimerRunning {
                    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
                        timerProgress > 0 ? timerProgress -= 0.01 : timer?.invalidate()
                        print("timerProgress : \(timerProgress)")
                        print("\(displayMinutes) : \(displaySeconds)")
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
