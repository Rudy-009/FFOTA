import SwiftUI

struct MainView: View {
    @Binding var index: Int
    @State var timerProgress: Double = 0
    @State var timer: Timer?
    @State var isTimerRunning = false
    
    var displayMinutes: String {
        String(format: "%02d", Int(timerProgress * 1 / 6))
    }
    
    var displaySeconds: String {
        String(format: "%02d", Int(timerProgress.truncatingRemainder(dividingBy: 6) * 10))
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: 80)
            Text("토익 문제 풀기")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(Theme.cherry.rawValue))
            
            TimerCircle(timerProgress: $timerProgress, isTimerRunning: $isTimerRunning)
            
            Button {
                isTimerRunning.toggle()
                if isTimerRunning {
                    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
                        timerProgress > 0 ? timerProgress -= 1 / 100 : timer?.invalidate()
                    }
                } else {
                    timer?.invalidate()
                }
            } label: {
                Text("\(timerProgress <= 0 ? "START" : "\(displayMinutes) : \(displaySeconds)")")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(Theme.cherry.rawValue))
                    .lineLimit(1)
                    .minimumScaleFactor(1)

            }
            .padding(.bottom, 100)
            
            Text("\(timerProgress)")
        }
        .background(Color(Theme.ivory.rawValue))
        .onChange(of: timerProgress) { newValue in
            if newValue <= 0 {
                isTimerRunning = false
                timerProgress = 0
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(index: .constant(1))
    }
}
