import SwiftUI

struct SnapView: View {
    
    var body: some View {
        
        NavigationView {
            CameraView(cameraType: .builtInWideAngleCamera, cameraPosition: .back)
                .navigationTitle("Snap&Give")
        }
    }
    
    
}

struct SnapView_Previews: PreviewProvider {
    static var previews: some View {
        SnapView()
    }
}
