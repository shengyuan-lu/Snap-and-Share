import SwiftUI

struct FoodListView: View {
    
    @ObservedObject var foodList: FoodList
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(foodList.foodDict.keys), id: \.self) { key in
                    FoodListCell(image: foodList.foodDict[key]!, name: key)
                        .padding(5)
                }
            }
            .navigationTitle("Food List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView(foodList: FoodList())
    }
}
