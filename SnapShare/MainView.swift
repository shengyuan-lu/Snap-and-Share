import SwiftUI

struct MainView: View {
    
    // MARK: - variables
    
    // MARK: - body
    var body: some View {
        
        TabView {
            SnapView()
                .tabItem {
                    Label("Snap & Share", image: "love-heart-hands-hold-1")
                }
            
            DonateView()
                .tabItem {
                    Label("Food Banks", image: "vegetables-plate")
                }
            
            NewsView()
                .tabItem {
                    Label("News", image: "newspaper-fold")
                }
        }
        .accentColor(.green)
        
    }
    
}

// MARK: - preview
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
