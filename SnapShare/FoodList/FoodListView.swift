import SwiftUI

struct FoodListView: View {
    
    @ObservedObject var foodList: FoodList
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                if foodList.foodDict.count == 0 {
                    Text("NO Food Available for Donate.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding()
                }
                
                List {
                    ForEach(Array(foodList.foodDict.keys), id: \.self) { key in
                        FoodListCell(image: foodList.foodDict[key]!, name: key)
                            .padding(5)
                    }
                    .onDelete(perform: { indexSet in
                        
                        var arr = [String]()
                        
                        for index in indexSet {
                            arr.append(Array(foodList.foodDict.keys)[index])
                        }
                        
                        for key in arr {
                            foodList.foodDict.removeValue(forKey: key)
                        }
                        
                    })
                }
                
                VStack(spacing: 10) {
                    
                    if foodList.foodDict.count != 0 {
                        
                        NavigationLink(
                            destination: FoodBankDetail(foodBank: foodBankList[1]),
                            
                            label: {
                                Text("Find me a Food Bank to Donate 🥦")
                                    .bold()
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.1)
                                    .frame(width: UIScreen.main.bounds.width/1.5, alignment: .center)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(8)
                            })
                    
                    }
                }
                .padding(.top, 30)
                .padding(.bottom, 20)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 0.0)
            }
            .navigationTitle("My Donation List")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView(foodList: FoodList())
    }
}
