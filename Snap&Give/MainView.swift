import SwiftUI

struct MainView: View {
    
    // MARK: - variables
    
    // MARK: - body
    var body: some View {
        
        TabView {
            SnapView()
                .tabItem {
                    Image(systemName: "camera.fill")
                }
            
            DonateView()
                .tabItem {
                    Image(systemName: "hands.sparkles.fill")
                }
            
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
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
