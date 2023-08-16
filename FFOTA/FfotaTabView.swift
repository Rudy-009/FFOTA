import SwiftUI

struct FfotaTabView: View {
    @State private var tabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $tabIndex){
            SettingView()
                .tag(0)
            MainView(index: $tabIndex)
                .tag(1)
            TaskListView(index: $tabIndex)
                .tag(2)
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
        .background(Color(red: 0.92, green: 0.86, blue: 0.76))
    }
}

struct FfotaTabView_Previews: PreviewProvider {
    static var previews: some View {
        FfotaTabView()
    }
}
