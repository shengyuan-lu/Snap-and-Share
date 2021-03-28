import SwiftUI

struct SnapView: View {
    
    let cornerRadius:CGFloat = 10
    let gReaderHeight:CGFloat = 120
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                CameraView()
                    .navigationTitle("Snap & Give")
                    .navigationBarTitleDisplayMode(.large)
                
                VStack {
                    GuideCard()
                        .frame(height: 160)
                    Spacer()
                }

            }
            

        }
        
    }
}


struct SnapView_Previews: PreviewProvider {
    static var previews: some View {
        SnapView()
    }
}
