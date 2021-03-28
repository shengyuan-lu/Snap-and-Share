import SwiftUI

struct SnapView: View {
    
    @StateObject var cameraModel = CameraModel()
    
    @ObservedObject var foodList: FoodList
    
    @State private var selection = 0
    
    let cornerRadius:CGFloat = 10
    let gReaderHeight:CGFloat = 120
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                CameraView(cameraModel: cameraModel, foodList: foodList)
                    .navigationTitle("📸 Snap & Share")
                    .navigationBarTitleDisplayMode(.large)
                
                VStack {
                    GuideCard(selection: $selection)
                        .frame(height: 160)
                        .padding(.horizontal, 5)
                    Spacer()
                }
                

            }
            .onChange(of: cameraModel.isTaken, perform: { value in
                if cameraModel.isTaken {
                    self.selection = 1
                } else if !cameraModel.isTaken {
                    self.selection = 0
                }
            })
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                HStack {
                    Image("vegetables-carrot")
                    
                    Text("\(foodList.foodDict.count)")
                        .fontWeight(.bold)
                }
                .font(.title2)
            }))
            
            
        }
        
    }
}


struct SnapView_Previews: PreviewProvider {
    static var previews: some View {
        SnapView(foodList: FoodList())
    }
}
