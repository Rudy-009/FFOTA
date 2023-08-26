import SwiftUI

struct TimerCircle: View {
    let timerDiameter = 300.0
    @Binding var timerProgress: Double
    @State var rotationAngle: Angle = Angle(degrees: 0)
    let impactMed = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        GeometryReader { geometryReader in
            ZStack {
                Circle()
                    .fill(Color(Theme.darkivory.rawValue))
                    .frame(width: timerDiameter)
                Path { path in
                    path.move(to: CGPoint(x: geometryReader.size.width / 2, y: geometryReader.size.height / 2))
                    path.addArc(
                        center: CGPoint(x: geometryReader.size.width / 2, y: geometryReader.size.height / 2),
                        radius: timerDiameter / 2,
                        startAngle: .degrees(-90),
                        endAngle: rotationAngle - Angle(degrees: 90),
                        clockwise: false
                    )
                    path.closeSubpath()
                }
                .fill(Color(Theme.strawberry.rawValue))
                Circle()
                    .fill(Color.white)
                    .frame(width: 21, height: 21)
                    .offset(y: -timerDiameter / 2.0)
                    .rotationEffect(rotationAngle)
                    .gesture(
                        DragGesture(minimumDistance: 0.0)
                            .onChanged({ draggedValue in
                                rotationAngle = changeAngle(location: draggedValue.location)
                            })
                    )
            }
        }
        .onChange(of: Int(timerProgress * 60)) { _ in
            impactMed.impactOccurred()
        }
    }
    
    func changeAngle(location: CGPoint) -> Angle {
        let vector = CGVector(dx: location.x, dy: -location.y)
        let angleRadians = atan2(vector.dx, vector.dy)
        var angle = angleRadians * 180 / .pi
        if angle < 0 { angle = 360 + angle }
        timerProgress = Double(angle)
        let roundValue = 6 * Int(round(timerProgress) / 6)
        timerProgress = Double(roundValue)

        return Angle(degrees: timerProgress)
    }
}

struct TimerCircle_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State private var timerProgress: Double = 0
        var body: some View {
            TimerCircle(timerProgress: $timerProgress)
        }
    }
}
