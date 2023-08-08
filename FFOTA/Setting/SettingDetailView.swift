import SwiftUI

struct SettingDetailView: View {
    @State var isVibrationToggleOn: Bool = false
    @State var isSoundToggleOn: Bool = false
    
    var body: some View {
        ZStack {
            Color("\(Theme.ivory)")
                .ignoresSafeArea(.all)
            
            VStack {
                Toggle(isOn: $isVibrationToggleOn) {
                    Text("진동 설정")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                }
                
                Toggle(isOn: $isSoundToggleOn) {
                    Text("소리 설정")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                }
                .padding(.top, 20)
            }
        }
    }
}

struct SettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SettingDetailView()
    }
}
