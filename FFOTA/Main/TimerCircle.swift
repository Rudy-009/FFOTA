import SwiftUI

struct TimerCIrcle: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(Theme.darkivory.rawValue))
            PieSegment(start: .zero, end: .degrees(190))
                .rotationEffect(.degrees(270))
                .foregroundColor(Color(Theme.strawberry.rawValue))
        }
    }
}

struct PieSegment: Shape {
    var start: Angle
    var end: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.midX, startAngle: start, endAngle: end, clockwise: false)
        return path
    }
}

struct TimerCIrcle_Previews: PreviewProvider {
    static var previews: some View {
        TimerCIrcle()
    }
}
