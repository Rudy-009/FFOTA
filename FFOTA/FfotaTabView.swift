import SwiftUI

struct FfotaTabView: View {
    @State private var tabIndex: Int = 1
    
    var body: some View {
        TabView(selection: $tabIndex){
            SettingView()
                .tag(0)
            MainView(index: $tabIndex)
                .tag(1)
            TaskListView()
                .tag(2)
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
    }
}

struct FfotaTabView_Previews: PreviewProvider {
    static var previews: some View {
        FfotaTabView()
    }
}
