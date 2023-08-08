import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            Color("\(Theme.ivory)")
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
                .listRowBackground(Color("\(Theme.ivory)"))
                
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
                .listRowBackground(Color("\(Theme.ivory)"))
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
