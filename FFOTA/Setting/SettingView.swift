import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            Color(red: 234/255, green: 220/255, blue: 195/255)
                .ignoresSafeArea(.all)
            
            List {
                Section {
                    StatisticView()
                } header: {
                    Text("통계")
                        .padding(.horizontal, -10)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .listRowBackground(Color(red: 234/255, green: 220/255, blue: 195/255))
                
                Section {
                    SettingDetailView()
                        .padding(10)
                } header: {
                    Text("설정")
                        .padding(.horizontal, -10)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .listRowBackground(Color(red: 234/255, green: 220/255, blue: 195/255))
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
