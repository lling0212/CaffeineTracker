import SwiftUI

struct AccountView: View {
    
    @State var selectedTab: String = "heart"
    @State var userid: String = ""
    @StateObject var viewModel: AccountViewViewModel
    @EnvironmentObject var drinkFlow: DrinkFlow
    
    init(userid: String) {
        self._userid = State(initialValue: userid)
        UITabBar.appearance().isHidden = true
        self._viewModel = StateObject(wrappedValue: AccountViewViewModel())
    }
    
    var body: some View {
        NavigationStack(path: $drinkFlow.path) {
            ZStack {

                    TabView(selection: $selectedTab){
                        
                        SummaryView(userid: userid)
                            .tag("heart")
                        
                        CalendarView(userid: userid)
                            .tag("calendar")
                        
                        DrinkListView(userid: userid)
                            .tag("list.bullet.circle")
                        
                        ProfileView()
                            .tag("person.crop.square")
                        
                    }
                    
                    CustomtabBar(selectedTab: $selectedTab, viewModel: viewModel)
                        .edgesIgnoringSafeArea(.bottom)

            }.navigationDestination(for: DrinkNavigation.self){ destination in DrinkViewFactory.setViewForDestination(destination)}
        }
    }
}

#Preview {
    AccountView(userid: "2IKkxUBSsONdTFsu7EWW25Vbkhc2")
        .environmentObject(DrinkFlow.shared)
}
