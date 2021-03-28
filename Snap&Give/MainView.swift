import SwiftUI

struct MainView: View {
    
    // MARK: - variables
    
    // MARK: - body
    var body: some View {
        
        TabView {
            SnapView()
                .tabItem {
                    
                    Label("Snap", image: "vegetables-plate")
                }
            
            DonateView()
                .tabItem {
                    Label("Give", image: "love-heart-hands-hold-1")
                }
            
            NewsView()
                .tabItem {
                    Label("News", image: "newspaper-fold")
                }
            
            
        }
        
    }
    
}

// MARK: - preview
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
